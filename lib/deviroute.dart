import 'package:flutter/material.dart';

/// A utility class to manage navigation between pages in a Flutter app.
class DeviRoute {
  /// Navigates to the specified [page] using the given [context].
  ///
  /// [context] is the BuildContext for navigation.
  /// [page] is the widget to navigate to.
  void route(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  /// Pops the current page off the navigation stack using the given [context].
  ///
  /// [context] is the BuildContext for navigation.
  void back(BuildContext context) {
    Navigator.pop(context);
  }
}
