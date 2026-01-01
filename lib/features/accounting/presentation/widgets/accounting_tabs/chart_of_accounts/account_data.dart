class Account {
  final String code;
  final String name;
  final String type;
  final double balance;
  final bool isGroup;
  final int level;

  Account({
    required this.code,
    required this.name,
    required this.type,
    required this.balance,
    this.isGroup = false,
    this.level = 0,
  });
}
