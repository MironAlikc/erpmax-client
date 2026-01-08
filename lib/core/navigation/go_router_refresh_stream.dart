import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    dev.log('GoRouterRefreshStream: Created and subscribing to stream');
    notifyListeners();
    _subscription = stream.listen((dynamic event) {
      dev.log('GoRouterRefreshStream: Auth state changed to $event');
      dev.log('GoRouterRefreshStream: Calling notifyListeners()');
      notifyListeners();
      dev.log('GoRouterRefreshStream: notifyListeners() called');
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    dev.log('GoRouterRefreshStream: Disposing');
    _subscription.cancel();
    super.dispose();
  }
}
