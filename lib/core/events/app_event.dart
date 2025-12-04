abstract class AppEvent {
  final String name;
  final DateTime timestamp;
  final Map<String, dynamic> data;

  AppEvent({required this.name, Map<String, dynamic>? data})
    : timestamp = DateTime.now(),
      data = data ?? <String, dynamic>{};
}


  