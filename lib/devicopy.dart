import 'package:flutter/services.dart';

/// A utility class to handle copying and pasting text to and from the clipboard.
class DeviCopy {
  /// Copies the provided [text] to the clipboard.
  ///
  /// [text] is the string to copy to the clipboard.
  void copy(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  /// Pastes the text from the clipboard.
  ///
  /// Returns the text from the clipboard, or `null` if an error occurs or the clipboard is empty.
  Future<String?> paste() async {
    try {
      ClipboardData? clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      return clipboardData?.text;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
