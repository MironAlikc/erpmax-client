abstract class AccountingDashboardEvent {
  const AccountingDashboardEvent();
}

class LoadDashboardData extends AccountingDashboardEvent {
  const LoadDashboardData();
}

class RefreshDashboardData extends AccountingDashboardEvent {
  const RefreshDashboardData();
}
