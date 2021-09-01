import 'package:flutter/material.dart';

class DeviRoute {
  route(context, page) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  back(context) {
    Navigator.pop(context);
  }
}
