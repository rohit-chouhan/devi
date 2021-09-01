Here the example of all method, enjoy coding 😃
### Route
```dart
import 'package:devi/page.dart';
import 'package:flutter/material.dart';
import 'package:devi/devi.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Devi devi = new Devi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devi Router"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  devi.route(context, MyPage()); // Route to next Page
                  devi.back(context); // Route to back
                },
                child: Text("Go to Second Page"))
          ],
        ),
      ),
    );
  }
}
```

### Devi Storage
Devi storage may have some issue in beta version, but will fix soon.
```dart
import 'package:flutter/material.dart';
import 'package:devi/devi.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String jsonData = '';
  Devi devi = new Devi('box'); //*parameter is required, when using disk storage
  TextEditingController key = new TextEditingController();
  TextEditingController value = new TextEditingController();
  TextEditingController read = new TextEditingController();
  TextEditingController reading = new TextEditingController();
  TextEditingController rov = new TextEditingController();
  TextEditingController check = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devi Storage"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: TextField(
                          controller: key,
                          decoration: InputDecoration(
                              labelText: "Key",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    new Flexible(
                      child: TextField(
                          controller: value,
                          decoration: InputDecoration(
                              labelText: "Value",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          devi.put(key.text, value.text);
                          devi.toast(context, title: "Key Created");
                        },
                        child: Text("Write a variable"))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: TextField(
                          controller: read,
                          decoration: InputDecoration(
                              labelText: "Key",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    new Flexible(
                      child: TextField(
                          controller: reading,
                          decoration: InputDecoration(
                              labelText: "Value",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var val = await devi.get(read.text);
                          setState(() {
                            reading = new TextEditingController(text: val);
                          });
                        },
                        child: Text("Read a variable"))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: TextField(
                          controller: rov,
                          decoration: InputDecoration(
                              labelText: "Key",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          devi.remove(rov.text);
                          devi.toast(context, title: "Key Removed");
                        },
                        child: Text("Remove a variable"))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: TextField(
                          controller: check,
                          decoration: InputDecoration(
                              labelText: "Key",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var label = '';
                          if (await devi.isHas(check.text) == true) {
                            label = 'Yes, Available';
                          } else {
                            label = 'Not Available';
                          }
                          devi.toast(context, title: label);
                        },
                        child: Text("Check a variable"))
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: ElevatedButton(
                          onPressed: () async {
                            jsonData = await devi.getJson();
                            setState(() {});
                          },
                          child: Text("Get All as JSON")),
                    ),
                    Flexible(
                      child: ElevatedButton(
                          onPressed: () {
                            devi.clean();
                            devi.toast(context, title: "Cleaned");
                          },
                          child: Text("Clean All")),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(jsonData)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### Devi Alerts
```dart
import 'package:flutter/material.dart';
import 'package:devi/devi.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Devi devi = new Devi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devi Alert"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      devi.toast(context,
                          title: "Hello I am Devi", // label of snackbar
                          buttonLabel: "I am Button", //label of action button
                          buttonTheme: Colors.white, //text color of button
                          theme: Colors.red, //background color of snackbar
                          onPressed: () {
                        print('Clicked');
                      });
                    },
                    child: Text("SnackBar / Toast")),
                ElevatedButton(
                    onPressed: () {
                      devi.alert(context,
                          title: "Devi", //header
                          description: "A good framework", //description
                          actions: [ //action buttons
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Ok")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"))
                          ]);
                    },
                    child: Text("DialogBox / Alert"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### Devi Clipboard
Paste has issue in some device, will fix soon.
```dart
import 'package:flutter/material.dart';
import 'package:devi/devi.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Devi devi = new Devi();
  TextEditingController copytext = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devi Clipboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: TextField(
                          controller: copytext,
                          decoration: InputDecoration(
                              labelText: "Text",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          devi.copy(copytext.text);
                          devi.toast(context, title: "Text Copied");
                        },
                        child: Text("Copy the text")),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          print(await devi.paste());
                          setState(() {
                            copytext =
                                new TextEditingController(text: devi.paste());
                          });
                          devi.toast(context, title: "Text Pasted");
                        },
                        child: Text("Paste the text"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### Devi Validator
```dart
import 'package:flutter/material.dart';
import 'package:devi/devi.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Devi devi = new Devi();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController url = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devi Validator"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              labelText: "Email",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (devi.isEmail(email.text) == true) {
                            devi.toast(context, title: "Email is valid");
                          } else {
                            devi.toast(context,
                                title: "Email is not valid", theme: Colors.red);
                          }
                        },
                        child: Text("isPassword")),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: TextField(
                          controller: pass,
                          decoration: InputDecoration(
                              labelText: "Password",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (devi.isPassword(pass.text) == true) {
                            devi.toast(context, title: "Password is strong");
                          } else {
                            devi.toast(context,
                                title: "Password is not strong",
                                theme: Colors.red);
                          }
                        },
                        child: Text("isEmail")),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: TextField(
                          controller: url,
                          decoration: InputDecoration(
                              labelText: "Url / Link",
                              contentPadding: EdgeInsets.all(10))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (devi.isUrl(url.text) == true) {
                            devi.toast(context, title: "Url is valid");
                          } else {
                            devi.toast(context,
                                title: "Url is not valid", theme: Colors.red);
                          }
                        },
                        child: Text("isUrl")),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```