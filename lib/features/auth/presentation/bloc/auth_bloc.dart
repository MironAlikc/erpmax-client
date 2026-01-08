import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/check_auth_status_usecase.dart';
import '../../domain/usecases/switch_tenant_usecase.dart';
import '../../domain/entities/tenant_entity.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'dart:developer' as dev;

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final SwitchTenantUseCase switchTenantUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.checkAuthStatusUseCase,
    required this.switchTenantUseCase,
  }) : super(const AuthState.initial()) {
    on<AuthCheckRequested>(_onCheckRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthSwitchTenantRequested>(_onSwitchTenantRequested);

    // Debug: Listen to stream to verify it emits events
    stream.listen((state) {
      dev.log('AuthBloc.stream emitted: $state');
    });
  }

  Future<void> _onCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await checkAuthStatusUseCase();

    result.fold(
      (failure) {
        dev.log('Auth check failed: ${failure.message}');
        emit(const AuthState.unauthenticated());
      },
      (userWithTenants) {
        dev.log(
          'Auth check successful: User ${userWithTenants.user.email} restored from storage',
        );
        final defaultTenant = userWithTenants.tenants.firstWhere(
          (t) => t.isDefault,
          orElse: () => userWithTenants.tenants.first,
        );

        emit(
          AuthState.authenticated(
            user: userWithTenants.user,
            tenants: userWithTenants.tenants,
            currentTenant: TenantEntity(
              id: defaultTenant.tenantId,
              name: defaultTenant.tenantName,
              slug: '',
              status: TenantStatus.active,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await loginUseCase(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) {
        dev.log('Login failed: ${failure.message}');
        emit(AuthState.error(message: failure.message));
      },
      (authResult) {
        dev.log('Login successful for user: ${authResult.user.email}');
        final authenticatedState = AuthState.authenticated(
          user: authResult.user,
          tenants: authResult.tenants,
          currentTenant: authResult.currentTenant,
        );
        emit(authenticatedState);
        dev.log('AuthBloc: Emitted authenticated state: $authenticatedState');
        dev.log('AuthBloc: Current state after emit: ${state}');
      },
    );
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await registerUseCase(
      email: event.email,
      password: event.password,
      fullName: event.fullName,
      companyName: event.companyName,
    );

    result.fold(
      (failure) {
        dev.log('Registration failed: ${failure.message}');
        emit(AuthState.error(message: failure.message));
      },
      (authResult) {
        dev.log('Registration successful for user: ${authResult.user.email}');
        emit(
          AuthState.authenticated(
            user: authResult.user,
            tenants: authResult.tenants,
            currentTenant: authResult.currentTenant,
          ),
        );
      },
    );
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await logoutUseCase();

    result.fold(
      (failure) {
        dev.log('Logout failed: ${failure.message}');
        emit(const AuthState.unauthenticated());
      },
      (_) {
        dev.log('Logout successful');
        emit(const AuthState.unauthenticated());
      },
    );
  }

  Future<void> _onSwitchTenantRequested(
    AuthSwitchTenantRequested event,
    Emitter<AuthState> emit,
  ) async {
    final currentState = state;
    if (currentState is! AuthAuthenticated) return;

    emit(const AuthState.loading());

    final result = await switchTenantUseCase(event.tenantId);

    result.fold(
      (failure) {
        dev.log('Switch tenant failed: ${failure.message}');
        emit(AuthState.error(message: failure.message));
      },
      (switchResult) {
        dev.log('Switch tenant successful to: ${switchResult.tenant.name}');
        emit(
          AuthState.authenticated(
            user: currentState.user,
            tenants: currentState.tenants,
            currentTenant: switchResult.tenant,
          ),
        );
      },
    );
  }
}
