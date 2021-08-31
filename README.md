<p align="center"><img src="https://github.com/rohit-chouhan/devi/blob/main/devi_header.png?raw=true"/></p>
<p align="center">A flutter framework for storage, navigator, validate manager, we made flutter easy and fast.</p>
<p align="center"><img src="https://github.com/rohit-chouhan/devi/blob/main/devi.png?raw=true"/></p>

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
To write or creating new storage variable here we use method put
```dart
Devi devi = new Devi('box1'); //box1 is parent storage name

devi.put('name','Rohit');
```
It will write Rohit as key `name` in `box1`, and store to the disk.

### Read a storage
For reading a existing disk storage we use get method
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
