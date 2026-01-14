import 'package:erpmax_client/features/saas_control/data/models/subscriber_model.dart';
import 'package:erpmax_client/features/saas_control/domain/usecases/get_subscribers_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'subscribers_bloc.freezed.dart';
part 'subscribers_event.dart';
part 'subscribers_state.dart';

@injectable
class SubscribersBloc extends Bloc<SubscribersEvent, SubscribersState> {
  final GetSubscribersUseCase _getSubscribersUseCase;

  SubscribersBloc(this._getSubscribersUseCase)
    : super(const SubscribersState.initial()) {
    on<_Started>((event, emit) => _onSubscribersFetched(emit));
    on<_RefreshRequested>((event, emit) => _onSubscribersFetched(emit));
  }

  Future<void> _onSubscribersFetched(Emitter<SubscribersState> emit) async {
    emit(const SubscribersState.loading());

    final result = await _getSubscribersUseCase();

    result.fold(
      (failure) => emit(SubscribersState.error(failure.message)),
      (subscribers) => emit(SubscribersState.success(subscribers: subscribers)),
    );
  }
}
