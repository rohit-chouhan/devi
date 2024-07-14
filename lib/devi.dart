import 'dart:convert';
import 'dart:io';
import 'package:devi/devialert.dart';
import 'package:devi/devicopy.dart';
import 'package:devi/deviroute.dart';
import 'package:devi/deviurl.dart';
import 'package:devi/devivalidate.dart';
import 'package:path_provider/path_provider.dart';

/// Devi class to manage file-based storage, extending functionality from DeviRoute
/// and mixing in features from DeviAlert, DeviCopy, DeviUrl, and DeviValidate.
class Devi extends DeviRoute with DeviAlert, DeviCopy, DeviUrl, DeviValidate {
  /// Name of the file where data is stored.
  String? fileName;

  /// Constructor to initialize the [fileName].
  Devi([this.fileName]);

  /// Writes a key-value pair to the file.
  ///
  /// [key] is the key to store the value under.
  /// [value] is the value to store.
  Future<void> put(String key, dynamic value) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName.txt');

    // Initial dummy write to create the file.
    await file.writeAsString('{"_test":"test"}');

    // Read the file and update the content with the new key-value pair.
    var getJson = json.decode(await file.readAsString());
    Map<String, dynamic> map = getJson;
    map[key] = value;
    map.remove('_test');
    var getFinal = json.encode(map);
    await file.writeAsString(getFinal);
  }

  /// Reads the value associated with the given key from the file.
  ///
  /// [key] is the key to look for in the file.
  /// Returns the value associated with the key or an error message if not found.
  Future<String?> get(String key) async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName.txt');

      String text = await file.readAsString();
      var decoded = json.decode(text);
      return decoded[key] ?? '[$key] is null or not found';
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Removes the key-value pair associated with the given key from the file.
  ///
  /// [key] is the key to remove from the file.
  /// Returns `true` if the operation was successful, otherwise `false`.
  Future<bool> remove(String key) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName.txt');

    try {
      var getJson = json.decode(await file.readAsString());
      Map<String, dynamic> map = getJson;
      map.remove(key);
      var getFinal = json.encode(map);
      await file.writeAsString(getFinal);
      return true;
    } catch (e) {
      print('Error: [$key] not found: $e');
      return false;
    }
  }

  /// Checks if the key exists in the file and has a non-empty value.
  ///
  /// [key] is the key to check for in the file.
  /// Returns `true` if the key exists and has a non-empty value, otherwise `false`.
  Future<bool> isHas(String key) async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName.txt');

      String text = await file.readAsString();
      var decoded = json.decode(text);
      return decoded[key]?.isNotEmpty ?? false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  /// Reads and returns the entire content of the file as a JSON string.
  Future<String?> getJson() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName.txt');

      return await file.readAsString();
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Clears the content of the file.
  ///
  /// Returns `true` if the operation was successful.
  Future<bool> clean() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName.txt');

      await file.writeAsString('');
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
