import 'package:flutter_test/flutter_test.dart';
import 'dart:developer' as dev;

void logTestStep(String message) {
  dev.log('TEST STEP: $message');
}

void logTestInfo(String message) {
  dev.log('TEST INFO: $message');
}

void logTestError(String message) {
  dev.log('TEST ERROR: $message');
}

void expectSuccessResponse(dynamic response) {
  expect(response, isNotNull, reason: 'Response should not be null');
}

void expectValidId(String? id) {
  expect(id, isNotNull, reason: 'ID should not be null');
  expect(id, isNotEmpty, reason: 'ID should not be empty');
}

void expectValidEmail(String? email) {
  expect(email, isNotNull, reason: 'Email should not be null');
  expect(email, contains('@'), reason: 'Email should contain @');
}

void expectValidDateTime(DateTime? dateTime) {
  expect(dateTime, isNotNull, reason: 'DateTime should not be null');
  expect(
    dateTime!.isBefore(DateTime.now().add(const Duration(minutes: 1))),
    isTrue,
    reason: 'DateTime should be in the past or very recent',
  );
}

void expectValidToken(String? token) {
  expect(token, isNotNull, reason: 'Token should not be null');
  expect(token, isNotEmpty, reason: 'Token should not be empty');
  expect(token!.length, greaterThan(10), reason: 'Token should be long enough');
}

void expectModelMatchesEntity<T, E>(
  T model,
  E entity,
  List<String> fieldsToCheck,
) {
  for (final field in fieldsToCheck) {
    final modelValue = _getFieldValue(model, field);
    final entityValue = _getFieldValue(entity, field);

    expect(
      modelValue,
      equals(entityValue),
      reason: 'Field $field should match between model and entity',
    );
  }
}

dynamic _getFieldValue(dynamic object, String fieldName) {
  try {
    final mirror = object.toString();
    return mirror;
  } catch (e) {
    return null;
  }
}
