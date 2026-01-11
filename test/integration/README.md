# Integration Tests for ERPMax Client API

## Overview

This directory contains integration tests for all ERPMax API endpoints. These tests connect to a real server to validate:

- API responses match expected structure
- Models correctly deserialize from JSON
- Entity conversions preserve all data
- All endpoints are accessible and functional

## Test Structure

```
test/integration/
├── config/
│   └── test_config.dart          # Test configuration and environment variables
├── helpers/
│   ├── test_client.dart          # HTTP client setup with authentication
│   └── test_helpers.dart         # Common test utilities and assertions
├── auth_api_test.dart            # Authentication API tests
├── tenant_api_test.dart          # Tenant management API tests
├── billing_api_test.dart         # Billing and subscription API tests
├── provisioning_api_test.dart    # Provisioning jobs API tests
├── sso_api_test.dart             # SSO token API tests
└── README.md                     # This file
```

## Prerequisites

1. **Running Server**: Ensure the ERPMax backend server is running
2. **Flutter SDK**: Flutter 3.8.1 or higher
3. **Dependencies**: Run `flutter pub get`

## Configuration

Tests can be configured using environment variables:

```bash
# Server configuration
TEST_BASE_URL=http://localhost:8000

# Test user credentials (optional - will create unique users)
TEST_EMAIL=test@example.com
TEST_PASSWORD=TestPassword123!
TEST_FULL_NAME=Test User
TEST_COMPANY_NAME=Test Company

# Test behavior
SKIP_CLEANUP=false          # Keep test data after tests
VERBOSE_LOGGING=true        # Enable detailed logging
```

## Running Tests

### Run All Integration Tests

```bash
flutter test test/integration/
```

### Run Specific Test Suite

```bash
# Auth API tests
flutter test test/integration/auth_api_test.dart

# Tenant API tests
flutter test test/integration/tenant_api_test.dart

# Billing API tests
flutter test test/integration/billing_api_test.dart

# Provisioning API tests
flutter test test/integration/provisioning_api_test.dart

# SSO API tests
flutter test test/integration/sso_api_test.dart
```

### Run with Custom Configuration

```bash
flutter test test/integration/ \
  --dart-define=TEST_BASE_URL=https://api.erpmax.com \
  --dart-define=VERBOSE_LOGGING=true
```

### Run with Coverage

```bash
flutter test test/integration/ --coverage
```

## Test Coverage

### Auth API (`auth_api_test.dart`)

- ✅ POST `/auth/register` - User registration
- ✅ POST `/auth/login` - User login
- ✅ GET `/auth/me` - Get current user
- ✅ POST `/auth/refresh` - Refresh access token
- ✅ POST `/auth/switch-tenant` - Switch active tenant
- ✅ POST `/auth/logout` - User logout
- ✅ Model to Entity conversions

### Tenant API (`tenant_api_test.dart`)

- ✅ GET `/tenants` - Get all user tenants
- ✅ GET `/tenants/current` - Get current tenant
- ✅ GET `/tenants/{id}` - Get tenant by ID
- ✅ PATCH `/tenants/{id}` - Update tenant
- ✅ GET `/tenants/{id}/users` - Get tenant users
- ✅ POST `/tenants/{id}/users/invite` - Invite user
- ✅ Model to Entity conversions

### Billing API (`billing_api_test.dart`)

- ✅ GET `/billing/plans` - Get available plans
- ✅ GET `/billing/subscription` - Get current subscription
- ✅ POST `/billing/checkout` - Create checkout session
- ✅ GET `/billing/invoices` - Get payment history
- ✅ POST `/billing/cancel` - Cancel subscription
- ✅ Model to Entity conversions

### Provisioning API (`provisioning_api_test.dart`)

- ✅ POST `/provisioning/jobs` - Create provisioning job
- ✅ GET `/provisioning/jobs` - Get all jobs
- ✅ GET `/provisioning/jobs/{id}` - Get job by ID
- ✅ POST `/provisioning/jobs/{id}/retry` - Retry failed job
- ✅ POST `/provisioning/jobs/{id}/cancel` - Cancel job
- ✅ Model to Entity conversions

### SSO API (`sso_api_test.dart`)

- ✅ POST `/sso/token` - Generate SSO token
- ✅ GET `/sso/erpnext/validate/{token}` - Validate SSO token
- ✅ Token expiration validation
- ✅ Invalid token handling
- ✅ Model to Entity conversions

## Test Features

### Automatic User Creation

Each test suite creates unique test users with timestamps to avoid conflicts:

```dart
final timestamp = DateTime.now().millisecondsSinceEpoch;
final email = 'test_${timestamp}@example.com';
```

### Authentication Management

Tests automatically handle JWT tokens:

- Store tokens after registration/login
- Include tokens in authenticated requests
- Clean up tokens after tests (unless `SKIP_CLEANUP=true`)

### Response Validation

All tests validate:

- HTTP status codes
- Response data structure
- Required fields presence
- Data types correctness
- DateTime formats
- ID formats (UUID)
- Email formats

### Model-Entity Conversion Testing

Each test suite includes validation that:

- Models correctly deserialize from JSON
- Entity conversion preserves all fields
- No data is lost in conversion
- Types remain consistent

## Common Test Helpers

### Validation Functions

```dart
expectValidId(String? id)           // Validates UUID format
expectValidEmail(String? email)     // Validates email format
expectValidToken(String? token)     // Validates JWT token
expectValidDateTime(DateTime? dt)   // Validates datetime
```

### Logging Functions

```dart
logTestStep(String message)    // Log test step
logTestInfo(String message)    // Log informational message
logTestError(String message)   // Log error message
```

## Troubleshooting

### Connection Refused

```
Error: Connection refused
```

**Solution**: Ensure the backend server is running on the configured URL.

### Authentication Failures

```
Error: 401 Unauthorized
```

**Solution**: Check that test credentials are valid and tokens are being stored correctly.

### Timeout Errors

```
Error: Connection timeout
```

**Solution**: Increase timeout in `test_config.dart` or check server performance.

### Model Deserialization Errors

```
Error: type 'Null' is not a subtype of type 'String'
```

**Solution**: Check that server response matches expected model structure.

## Best Practices

1. **Isolation**: Each test should be independent and not rely on other tests
2. **Cleanup**: Tests should clean up created data (unless debugging)
3. **Unique Data**: Use timestamps to create unique test data
4. **Assertions**: Use descriptive assertion messages
5. **Logging**: Log important steps for debugging

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Integration Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.8.1'
      
      - name: Install dependencies
        run: flutter pub get
      
      - name: Start backend server
        run: |
          cd ../backend
          docker-compose up -d
          sleep 10
      
      - name: Run integration tests
        run: flutter test integration_test/
        env:
          TEST_BASE_URL: http://localhost:8000
```

## Contributing

When adding new API endpoints:

1. Create corresponding test file or add to existing suite
2. Follow existing test structure and naming conventions
3. Include model-to-entity conversion tests
4. Add documentation to this README
5. Ensure tests pass before submitting PR

## Notes

- Tests create real data on the server
- Use `SKIP_CLEANUP=true` for debugging
- Tests run sequentially within each suite
- Each suite creates its own authenticated session
- Timestamps ensure unique test data

## Support

For issues or questions:

- Check server logs for backend errors
- Enable `VERBOSE_LOGGING=true` for detailed output
- Review test output for specific error messages
- Ensure all dependencies are up to date

---

**Last Updated**: January 2026
**API Version**: v1
**Flutter Version**: 3.8.1+
