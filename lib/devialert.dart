import 'package:flutter/material.dart';

/// A utility class to show alert dialogs and toast notifications in a Flutter app.
class DeviAlert {
  /// Shows an alert dialog with the provided [title], [description], and [actions].
  ///
  /// [context] is the BuildContext to display the dialog.
  /// [title] is the title of the dialog.
  /// [description] is the content of the dialog.
  /// [actions] are the actions to display in the dialog.
  Future<void> alert(
    BuildContext context, {
    String title = '',
    String description = '',
    List<Widget>? actions,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss.
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: actions,
        );
      },
    );
  }

  /// Shows a toast notification with the provided [title], [buttonLabel], [onPressed], [buttonTheme], and [theme].
  ///
  /// [context] is the BuildContext to display the toast.
  /// [title] is the message to display in the toast.
  /// [buttonLabel] is the label of the action button in the toast.
  /// [onPressed] is the callback function to execute when the button is pressed.
  /// [buttonTheme] is the color of the button label.
  /// [theme] is the background color of the toast.
  void toast(
    BuildContext context, {
    String? title,
    String? buttonLabel,
    Function()? onPressed,
    Color? buttonTheme,
    Color? theme,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title ?? ''),
        backgroundColor: theme ?? Colors.green,
        action: SnackBarAction(
          label: buttonLabel ?? '',
          textColor: buttonTheme ?? Colors.black,
          onPressed: onPressed ?? () {},
        ),
      ),
    );
  }
}
