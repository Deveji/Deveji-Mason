import 'package:{{project_name}}/utils/errors/navigation_error.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tests for the [NavigationError] class description.
void main() {
  test('Should return correct error message for a given path', () {
    final error = NavigationError('/home');

    expect(error.toString(), 'NavigationError: Failed to navigate to /home.');
  });

  test('Should handle empty path', () {
    final error = NavigationError('');

    expect(error.toString(), 'NavigationError: Failed to navigate to .');
  });

  test('Should handle null path', () {
    final error = NavigationError(null);

    expect(error.toString(), 'NavigationError: Failed to navigate to null.');
  });
}
