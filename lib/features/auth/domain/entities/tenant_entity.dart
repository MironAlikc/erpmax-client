import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_entity.freezed.dart';

enum TenantStatus {
  pending,
  provisioning,
  active,
  suspended,
  cancelled,
}

@freezed
abstract class TenantEntity with _$TenantEntity {
  const factory TenantEntity({
    required String id,
    required String name,
    required String slug,
    required TenantStatus status,
    String? erpnextSiteUrl,
    Map<String, dynamic>? settings,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TenantEntity;
}
