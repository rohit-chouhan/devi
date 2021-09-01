<p align="center"><img src="https://github.com/rohit-chouhan/devi/blob/main/devi_header.png?raw=true"/></p>
<p align="center">A flutter framework for storage, navigator, validate manager, we made flutter easy and fast.</p>
<p align="center"><img src="https://github.com/rohit-chouhan/devi/blob/main/devi.png?raw=true"/></p>

## Table of content
- [About Devi](#about-devi)
- [Object creating](#object-creating)
- [Route Management](#route-management)
- [Disk Storage](#disk-storage)
  * [Write a storage](#write-a-storage)
  * [Read a storage](#read-a-storage)
  * [Checking a storage](#checking-a-storage)
  * [Remove a storage](#remove-a-storage)
  * [Get all storage as JSON](#get-all-storage-as-json)
  * [Clear all varibale](#clear-all-varibale)
- [Snackbar and Alert](#snackbar-and-alert)
  * [SnackBar or Toast](#snackbar-or-toast)
  * [Dialogbox or Alert](#dialogbox-or-alert)
- [Copy to clipboard](#copy-to-clipboard)
- [Validator](#validator)

## About Devi

Devi is a fast and light framework for flutter to make work easy, its make management fast. Devi has very easy code and clean code to understand for beginner and all. Its allow to management for route, disk storage, alerts and validation.

## Object creating
Before using user have to intilize object for class DEVI.
```dart
Devi devi = new Devi();
```
When want to use disk storage.
```dart
Devi box1 = new Devi('box1');
Devi box2 = new Devi('box2');
```

## Route Management
If you want to navigate to another screen, so here we use the route management to jump to another screen.
```dart
devi.route(context,MyApp()); 
```
It will create route to screen MyApp.
For going back from current screen to previous screen, here we use back() method
```dart
devi.back(); 
```
It will route to you previous screen.

## Disk Storage
Disk storage is use to create disk variable as cache in your application. which is permanently created in system till formating device. Its very light to use and based on JSON.

### Write a storage
To write or creating new storage variable here we use method put()
```dart
Devi devi = new Devi('box1'); //box1 is parent storage name

devi.put('name','Rohit');
```
It will write Rohit as key `name` in `box1`, and store to the disk.

### Read a storage
For reading a existing disk storage we use get() method
```dart
devi.get('name');
```
It will return value of key `name`.

### Checking a storage
For checking is variable is available or not in disk.
```dart
devi.isHas('name'); //will return true or false
```
Another example
```dart
if(devi.isHas('name') == true){
  print('Yes, key is found');
} else {
  print('No, key not found');
}
```
### Remove a storage
For clear specific key from storage we use remove() method
```dart
devi.remove('name');
```
It will remove name key from storage.

### Get all storage as JSON
For getting all stored value from box, here we use getJson() method
```dart
Devi devi = new Devi('box1');
devi.put('name','Rohit');
devi.put('county','India');

devi.getJson();
```
will return
```json
{
  "name":"Rohit",
  "country":"India"
}
```

### Clear all varibale 
For clearing all disk variable here we use clean method.
```dart
devi.clean();
```

## Snackbar and Alert
Snackbar and alert is use to create a pop information in application.

### SnackBar or Toast
for creating snackbar on application here we have method toast()
```dart
devi.toast(context,
  title: "Hello, I am SnackBar",
  buttonLabel: "Ok", 
  onPressed: () {
    print("SnackBar Clicked!");
});
 ```
 for applying theme on snackbar we use theme properties
 ```dart
devi.toast(context,
  theme: Colors.red, //background color
  buttonTheme: Colors.white, //button color
  title: "Hello, I am SnackBar",
  buttonLabel: "Ok",
    onPressed: () {
      print("SnackBar Clicked!"); 
});
  ```
  ### Dialogbox or Alert
  To show pop up dialogbox here we use alert() method
  ```dart
devi.alert(context,
  title: "Heading",
  description: "This is Alert Box",
  actions: [
    TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Ok"))
]);
  ```
  
## Copy to clipboard
When you want to copy and text in clipboard here we use copy() method
```dart
String text = "Hello, I am devi!";
devi.copy(text);
devi.paste(); // will return copied txt
```
It will copy text to your system clipboard.


## Validator
There is some string validator to validate email, strong password etc.
```dart
String email = "abc@gmail.com";
if(devi.isEmail(email) == true){
  print("Email is valid");
} else {
  print("Email is not valid");
}

String password = "Qwerty@123";
if(devi.isPassword(password) == true){
  print("Password is strong");
} else {
  print("Password is weak");
}


String website = "http://google.com";
if(devi.isUrl(website) == true){
  print("URL is strong");
} else {
  print("URL is weak");
}
