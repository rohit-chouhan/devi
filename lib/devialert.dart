import 'package:flutter/material.dart';

class DeviAlert {
  void alert(
    context, {
    String title = '',
    String description = '',
    List<Widget>? actions,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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

  toast(context,
      {String? title,
      String? buttonLabel,
      Function()? onPressed,
      Color? buttonTheme,
      Color? theme}) {
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
