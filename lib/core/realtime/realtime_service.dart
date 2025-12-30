import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer' as dev;

@lazySingleton
class RealtimeService {
  static const String baseUrl = 'http://localhost:8000/ws';

  io.Socket? _socket;
  final FlutterSecureStorage _storage;

  // Callbacks for provisioning events
  Function(Map<String, dynamic>)? onProvisioningUpdate;
  Function(Map<String, dynamic>)? onProvisioningCompleted;
  Function(Map<String, dynamic>)? onProvisioningFailed;

  // Callbacks for notification events
  Function(Map<String, dynamic>)? onNotification;

  // Callbacks for billing events
  Function(Map<String, dynamic>)? onSubscriptionUpdated;
  Function(Map<String, dynamic>)? onPaymentReceived;

  RealtimeService(this._storage);

  /// Connect to Socket.IO server
  Future<void> connect() async {
    final token = await _storage.read(key: 'access_token');
    if (token == null) {
      dev.log('No access token found for Socket.IO connection');
      return;
    }

    if (_socket?.connected ?? false) {
      dev.log('Socket.IO already connected');
      return;
    }

    _socket = io.io(
      baseUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setPath('/socket.io')
          .setAuth({'token': token})
          .enableAutoConnect()
          .build(),
    );

    _setupListeners();
    _socket!.connect();
  }

  void _setupListeners() {
    if (_socket == null) return;

    // Connection events
    _socket!.on('connect', (_) {
      dev.log('Socket.IO connected');
    });

    _socket!.on('connected', (data) {
      dev.log('Socket.IO authenticated: $data');
    });

    _socket!.on('disconnect', (_) {
      dev.log('Socket.IO disconnected');
    });

    _socket!.on('error', (data) {
      dev.log('Socket.IO error: $data');
    });

    // Provisioning events
    _socket!.on('status:update', (data) {
      dev.log('Provisioning update: $data');
      if (data is Map<String, dynamic>) {
        onProvisioningUpdate?.call(data);
      }
    });

    _socket!.on('status:completed', (data) {
      dev.log('Provisioning completed: $data');
      if (data is Map<String, dynamic>) {
        onProvisioningCompleted?.call(data);
      }
    });

    _socket!.on('status:failed', (data) {
      dev.log('Provisioning failed: $data');
      if (data is Map<String, dynamic>) {
        onProvisioningFailed?.call(data);
      }
    });

    // Notification events
    _socket!.on('notification:new', (data) {
      dev.log('New notification: $data');
      if (data is Map<String, dynamic>) {
        onNotification?.call(data);
      }
    });

    // Billing events
    _socket!.on('subscription:updated', (data) {
      dev.log('Subscription updated: $data');
      if (data is Map<String, dynamic>) {
        onSubscriptionUpdated?.call(data);
      }
    });

    _socket!.on('payment:received', (data) {
      dev.log('Payment received: $data');
      if (data is Map<String, dynamic>) {
        onPaymentReceived?.call(data);
      }
    });
  }

  /// Mark notification as read
  void markNotificationRead(String notificationId) {
    if (_socket?.connected ?? false) {
      _socket?.emit('notification_read', {'notification_id': notificationId});
      dev.log('Marked notification as read: $notificationId');
    } else {
      dev.log('Cannot mark notification as read: Socket not connected');
    }
  }

  /// Disconnect from Socket.IO server
  void disconnect() {
    if (_socket != null) {
      dev.log('Disconnecting Socket.IO');
      _socket?.disconnect();
      _socket?.dispose();
      _socket = null;
    }
  }

  /// Check if connected
  bool get isConnected => _socket?.connected ?? false;

  /// Reconnect to Socket.IO server
  Future<void> reconnect() async {
    disconnect();
    await connect();
  }
}
