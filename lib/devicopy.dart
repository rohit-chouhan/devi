import 'package:flutter/services.dart';

class DeviCopy {
  copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  paste() {
    try {
      Clipboard.getData(Clipboard.kTextPlain).then((value) {
        return value!.text; //value is clipbarod data
      });
    } catch (_) {}
  }
}
