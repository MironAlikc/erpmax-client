import 'package:meta/meta.dart';

@immutable
abstract class AppEvent {
  final DateTime timestamp;
  final Map<String, dynamic> data;

  AppEvent({Map<String, dynamic>? data})
    : timestamp = DateTime.now(),
      data = data ?? <String, dynamic>{};

  @override
  String toString() => '$runtimeType (time: $timestamp, data: $data)';
}
