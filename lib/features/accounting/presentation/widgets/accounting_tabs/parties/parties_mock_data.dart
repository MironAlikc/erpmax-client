enum PartyType { customers, suppliers }

class MockPartiesDataService {
  // Данные для карточек остаются прежними
  static PartiesStats getStatistics() => PartiesStats(
    totalCustomers: 156,
    activeCustomers: 142,
    totalReceivables: "485K",
    overdueReceivables: "75K",
    totalSuppliers: 89,
    activeSuppliers: 78,
    totalPayables: "320K",
    overduePayables: "45K",
  );

  // Список КЛИЕНТОВ
  static List<Customer> getCustomers() {
    return [
      Customer(
        id: "#1131",
        name: "Customer A",
        group: "VIP",
        phone: "+966 50 123 4567",
        city: "Riyadh",
        balance: 5000,
        limit: 50000,
        lastActivityDate: "2024-02-20",
        lastActivityAmount: 150000,
        isActive: true,
      ),
    ];
  }

  // Список ПОСТАВЩИКОВ
  static List<Supplier> getSuppliers() {
    return [
      Supplier(
        id: "2111",
        accountNumber: "2111",
        name: "Supplier X",
        type: "Company",
        city: "Dammam",
        phoneNumber: "+966 13 123 4567",
        balance: 12000,
      ),
      Supplier(
        id: "2112",
        accountNumber: "2112",
        name: "Supplier Y",
        type: "Company",
        city: "Riyadh",
        phoneNumber: "+966 11 987 6543",
        balance: 3500,
      ),
    ];
  }
}

// Модель для верхних карточек статистики
class PartiesStats {
  final int totalCustomers;
  final int activeCustomers;
  final String totalReceivables; // Используем String для формата "485K"
  final String overdueReceivables;
  final int totalSuppliers;
  final int activeSuppliers;
  final String totalPayables;
  final String overduePayables;

  PartiesStats({
    required this.totalCustomers,
    required this.activeCustomers,
    required this.totalReceivables,
    required this.overdueReceivables,
    required this.totalSuppliers,
    required this.activeSuppliers,
    required this.totalPayables,
    required this.overduePayables,
  });
}

// Базовый класс для всех партнеров
abstract class Party {
  final String id;
  final String name;
  final double balance;
  final String city;

  Party({
    required this.id,
    required this.name,
    required this.balance,
    required this.city,
  });
}

// Модель Клиента (из первого скриншота)
class Customer extends Party {
  final String group;
  final String phone;
  final double limit;
  final String lastActivityDate;
  final double lastActivityAmount;
  final bool isActive;

  Customer({
    required super.id,
    required super.name,
    required super.balance,
    required super.city,
    required this.group,
    required this.phone,
    required this.limit,
    required this.lastActivityDate,
    required this.lastActivityAmount,
    required this.isActive,
  });
}

// Модель Поставщика (из нового скриншота)
class Supplier extends Party {
  final String accountNumber;
  final String type; // Например, "Company"
  final String phoneNumber;

  Supplier({
    required super.id, // Здесь ID может выступать как Account Number
    required super.name,
    required super.balance,
    required super.city,
    required this.accountNumber,
    required this.type,
    required this.phoneNumber,
  });
}
