import 'package:flutter/material.dart';

extension NavigationHelper on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return Navigator.of(this).pushReplacementNamed(routeName);
  }

  Future<dynamic> pushAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) async {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}