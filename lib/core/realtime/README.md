# Real-time Service (Socket.IO)

## Overview

`RealtimeService` provides WebSocket-based real-time communication with the ERPMax backend using Socket.IO.

## Features

- **Provisioning Events**: Real-time updates for provisioning jobs
- **Notification Events**: Instant notifications for users
- **Billing Events**: Live subscription and payment updates
- **Auto-reconnection**: Automatic reconnection on connection loss
- **JWT Authentication**: Secure connection using access tokens

## Usage

### 1. Basic Connection

```dart
import 'package:erpmax_client/core/realtime/realtime_service.dart';
import 'package:get_it/get_it.dart';

// Get service from DI
final realtimeService = GetIt.instance<RealtimeService>();

// Connect to Socket.IO server
await realtimeService.connect();

// Check connection status
if (realtimeService.isConnected) {
  print('Connected to real-time server');
}
```

### 2. Listen to Provisioning Events

```dart
// Setup callbacks before connecting
realtimeService.onProvisioningUpdate = (data) {
  print('Provisioning update: ${data['job_id']} - ${data['status']}');
  // Update UI with job progress
};

realtimeService.onProvisioningCompleted = (data) {
  print('Provisioning completed: ${data['job_id']}');
  // Show success notification
};

realtimeService.onProvisioningFailed = (data) {
  print('Provisioning failed: ${data['job_id']} - ${data['error']}');
  // Show error notification
};

await realtimeService.connect();
```

### 3. Listen to Notification Events

```dart
realtimeService.onNotification = (data) {
  final notification = {
    'id': data['id'],
    'title': data['title'],
    'message': data['message'],
    'type': data['type'],
  };
  
  // Show notification to user
  showNotification(notification);
  
  // Mark as read
  realtimeService.markNotificationRead(data['id']);
};
```

### 4. Listen to Billing Events

```dart
realtimeService.onSubscriptionUpdated = (data) {
  print('Subscription updated: ${data['status']}');
  // Refresh subscription data
};

realtimeService.onPaymentReceived = (data) {
  print('Payment received: ${data['amount']} ${data['currency']}');
  // Show payment confirmation
};
```

### 5. Disconnect

```dart
// Disconnect when done (e.g., on logout)
realtimeService.disconnect();
```

### 6. Reconnect

```dart
// Reconnect after network issues
await realtimeService.reconnect();
```

## Event Types

### Provisioning Events

- **status:update** - Job status update

  ```json
  {
    "job_id": "uuid",
    "status": "in_progress",
    "progress": 50,
    "message": "Installing dependencies..."
  }
  ```

- **status:completed** - Job completed successfully

  ```json
  {
    "job_id": "uuid",
    "status": "completed",
    "result": {...}
  }
  ```

- **status:failed** - Job failed

  ```json
  {
    "job_id": "uuid",
    "status": "failed",
    "error": "Error message"
  }
  ```

### Notification Events

- **notification:new** - New notification

  ```json
  {
    "id": "uuid",
    "title": "Notification title",
    "message": "Notification message",
    "type": "info|success|warning|error",
    "created_at": "2024-12-29T00:00:00Z"
  }
  ```

### Billing Events

- **subscription:updated** - Subscription status changed

  ```json
  {
    "subscription_id": "uuid",
    "status": "active|canceled|past_due",
    "plan": "pro",
    "updated_at": "2024-12-29T00:00:00Z"
  }
  ```

- **payment:received** - Payment processed

  ```json
  {
    "payment_id": "uuid",
    "amount": 99.99,
    "currency": "USD",
    "status": "succeeded",
    "created_at": "2024-12-29T00:00:00Z"
  }
  ```

## Integration with BLoC

```dart
class ProvisioningBloc extends Bloc<ProvisioningEvent, ProvisioningState> {
  final RealtimeService _realtimeService;
  
  ProvisioningBloc(this._realtimeService) : super(ProvisioningInitial()) {
    _setupRealtimeListeners();
  }
  
  void _setupRealtimeListeners() {
    _realtimeService.onProvisioningUpdate = (data) {
      add(ProvisioningJobUpdated(
        jobId: data['job_id'],
        status: data['status'],
        progress: data['progress'],
      ));
    };
    
    _realtimeService.onProvisioningCompleted = (data) {
      add(ProvisioningJobCompleted(jobId: data['job_id']));
    };
    
    _realtimeService.onProvisioningFailed = (data) {
      add(ProvisioningJobFailed(
        jobId: data['job_id'],
        error: data['error'],
      ));
    };
  }
  
  @override
  Future<void> close() {
    _realtimeService.disconnect();
    return super.close();
  }
}
```

## Configuration

The service connects to `http://localhost:8000/ws` by default. To change the URL:

```dart
// Update in realtime_service.dart
static const String baseUrl = 'https://your-domain.com/ws';
```

## Notes

- The service uses JWT tokens from `flutter_secure_storage`
- Connection is established automatically when `connect()` is called
- Events are logged using `dart:developer` for debugging
- The service is registered as a singleton in the DI container
