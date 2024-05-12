import 'package:flutter/material.dart';

/// Extension for [BuildContext] to access routing methods.
extension RoutingX on BuildContext {
  /// Pushes the route to the navigator.
  void push(String routePath, {Object? arguments}) {
    Navigator.of(this).pushNamed(routePath, arguments: arguments);
  }

  /// Pops the route from the navigator.
  void pop() {
    Navigator.of(this).pop();
  }

  /// Pushes the route to the navigator and removes the previous route.
  void pushReplacement(String routePath, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routePath, arguments: arguments);
  }
}
