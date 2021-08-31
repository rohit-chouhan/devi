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
