import 'package:erpmax_client/features/saas_control/data/models/report_models.dart';

final List<ReportSubscriber> newSubscribersData = [
  const ReportSubscriber(
    company: "StartUp Inc",
    plan: "Starter",
    status: "Active",
    startDate: "2024-05-20",
    endDate: "2025-05-20",
    price: "SAR 1,000",
  ),
  const ReportSubscriber(
    company: "New Ventures",
    plan: "Professional",
    status: "Active",
    startDate: "2024-05-18",
    endDate: "2025-05-18",
    price: "SAR 2,500",
  ),
  const ReportSubscriber(
    company: "Alpha Tech",
    plan: "Enterprise",
    status: "Active",
    startDate: "2024-05-15",
    endDate: "2025-05-15",
    price: "SAR 5,000",
  ),
];

final List<ReportSubscriber> expiringSoonData = [
  const ReportSubscriber(
    company: "Old Co",
    plan: "Enterprise",
    status: "Expired",
    startDate: "2023-05-01",
    endDate: "2024-05-01",
    price: "SAR 10,000",
  ),
  const ReportSubscriber(
    company: "Tech Giants",
    plan: "Professional",
    status: "Active",
    startDate: "2023-06-01",
    endDate: "2024-06-01",
    price: "SAR 2,500",
  ),
];
