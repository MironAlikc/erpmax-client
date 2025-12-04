import 'dart:async';

import 'package:erpmax_client/core/events/app_event.dart';

class EventBus {
  EventBus._internal();

  static final EventBus _instance = EventBus._internal();

  factory EventBus() => _instance;

  final _controller = StreamController<AppEvent>.broadcast();

  Stream<AppEvent> get stream => _controller.stream;

  StreamSubscription<AppEvent> on<T extends AppEvent>(
    void Function(T event) handler,
  ) {
    return _controller.stream
        .where((event) => event is T)
        .cast<T>()
        .listen(handler);
  }

  void emit(AppEvent event) {
    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}
