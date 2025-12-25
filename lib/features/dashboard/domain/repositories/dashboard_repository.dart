import 'package:erpmax_client/features/dashboard/domain/entities/subscription_entity.dart';
import 'package:erpmax_client/features/dashboard/domain/entities/summary_entity.dart';

abstract class DashboardRepository {
  List<SummaryEntity> getSummaryData();
  List<SubscriptionEntity> getSubscriptions();
}
