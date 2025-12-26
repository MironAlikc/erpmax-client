import 'package:erpmax_client/features/auth/domain/entities/tenant_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_model.freezed.dart';
part 'tenant_model.g.dart';

@freezed
abstract class TenantModel with _$TenantModel {
  const TenantModel._();

  const factory TenantModel({
    required String id,
    required String name,
    required String slug,
    required TenantStatus status,
    @JsonKey(name: 'erpnext_site_url') String? erpnextSiteUrl,
    Map<String, dynamic>? settings,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _TenantModel;

  factory TenantModel.fromJson(Map<String, dynamic> json) =>
      _$TenantModelFromJson(json);

  TenantEntity toEntity() => TenantEntity(
    id: id,
    name: name,
    slug: slug,
    status: status,
    erpnextSiteUrl: erpnextSiteUrl,
    settings: settings,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
