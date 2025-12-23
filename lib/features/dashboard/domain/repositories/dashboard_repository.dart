import '../entities/summary_entity.dart';
import '../entities/subscription_entity.dart';

abstract class DashboardRepository {
  List<SummaryEntity> getSummaryData();
  List<SubscriptionEntity> getSubscriptions();
}
