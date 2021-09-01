import 'dart:convert';
import 'dart:io';
import 'package:devi/devialert.dart';
import 'package:devi/devicopy.dart';
import 'package:devi/deviroute.dart';
import 'package:devi/deviurl.dart';
import 'package:devi/devivalidate.dart';
import 'package:path_provider/path_provider.dart';

class Devi extends DeviRoute with DeviAlert, DeviCopy, DeviUrl, DeviValidate {
  String? fileName;
  Devi([this.fileName]);

  //writing data
  put(String key, var value) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName.txt');

    await file.writeAsString('{"_test":"test"}');

    var getJson = json.decode(await file.readAsString());
    Map map = getJson;
    map[key] = value;
    map.remove('_test');
    var getFinal = json.encode(map);
    await file.writeAsString(getFinal);
  }

  //reading data
  get(x) async {
    String? text;
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName.txt');

      text = await file.readAsString();
      var t = json.decode(text);
      text = t[x];
      return text == null ? '[$x] is null or not found' : text;
    } catch (e) {
      print('error');
    }
  }

  //removing data
  remove(String key) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName.txt');

    try {
      var getJson = json.decode(await file.readAsString());
      Map map = getJson;
      map.remove(key);
      var getFinal = json.encode(map);
      await file.writeAsString(getFinal);
      return true;
    } catch (_) {
      print('[$key] not found]');
      return false;
    }
  }

  //check
  isHas(x) async {
    String? text;
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName.txt');

      text = await file.readAsString();
      var t = json.decode(text);
      text = t[x];

      return text!.isEmpty == true ? false : true;
    } catch (e) {
      print('error');
    }
  }

  getJson() async {
    String? text;
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName.txt');

      text = await file.readAsString();

      return text;
    } catch (e) {
      print('error');
    }
  }

  clean() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/$fileName.txt');

      await file.writeAsString('');

      return true;
    } catch (e) {
      print('error');
    }
  }
}
