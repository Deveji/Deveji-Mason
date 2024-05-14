/// Error thrown when navigation fails
class NavigationError extends Error {
  /// Creates a NavigationError
  NavigationError(this.toPath);

  /// Path to which navigation failed
  final String? toPath;

  @override
  String toString() {
    return 'NavigationError: Failed to navigate to $toPath.';
  }
}
