enum PartiesType { customers, suppliers }

class MockPartiesDataService {
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

  static List<Customer> getCustomers() {
    return [
      Customer(
        id: "#1131",
        name: "Ahmed Al-Saud",
        group: "VIP",
        phone: "+966 50 123 4567",
        city: "Riyadh",
        balance: 50000.0,
        limit: 100000.0,
        lastActivityDate: "2024-01-10",
        lastActivityAmount: 12000.0,
        isActive: true,
      ),
      Customer(
        id: "#1132",
        name: "Ziad Rahbani",
        group: "Regular",
        phone: "+966 53 123 4997",
        city: "Jeddah",
        balance: 1500.0,
        limit: 5000.0,
        lastActivityDate: "2024-03-25",
        lastActivityAmount: 850.0,
        isActive: true,
      ),
      Customer(
        id: "#1133",
        name: "Bella Hadid",
        group: "VIP",
        phone: "+966 55 987 6543",
        city: "Dammam",
        balance: 125000.0,
        limit: 200000.0,
        lastActivityDate: "2024-02-15",
        lastActivityAmount: 45000.0,
        isActive: false,
      ),
      Customer(
        id: "#1134",
        name: "Omar Sharif",
        group: "Business",
        phone: "+966 51 444 5566",
        city: "Medina",
        balance: 8900.0,
        limit: 15000.0,
        lastActivityDate: "2024-03-01",
        lastActivityAmount: 3200.0,
        isActive: true,
      ),
      Customer(
        id: "#1135",
        name: "Yasmine Sabri",
        group: "Regular",
        phone: "+966 59 777 8899",
        city: "Riyadh",
        balance: -250.0,
        limit: 1000.0,
        lastActivityDate: "2023-12-20",
        lastActivityAmount: 500.0,
        isActive: true,
      ),
      Customer(
        id: "#1136",
        name: "Khalid Mansour",
        group: "Business",
        phone: "+966 54 222 3311",
        city: "Khobar",
        balance: 34200.0,
        limit: 50000.0,
        lastActivityDate: "2024-03-12",
        lastActivityAmount: 15600.0,
        isActive: true,
      ),
    ];
  }

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

class PartiesStats {
  final int totalCustomers;
  final int activeCustomers;
  final String totalReceivables;
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

class Supplier extends Party {
  final String accountNumber;
  final String type;
  final String phoneNumber;

  Supplier({
    required super.id,
    required super.name,
    required super.balance,
    required super.city,
    required this.accountNumber,
    required this.type,
    required this.phoneNumber,
  });
}
