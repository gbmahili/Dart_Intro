import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Layouts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Layouts'),
          ),
          body: Container(
            // margin: EdgeInsets.all(70),
            // padding: EdgeInsets.only(top: 24),
            alignment: Alignment.center,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.red),
              borderRadius: BorderRadius.all(
                  Radius.circular(5.0) //         <--- border radius here
                  ),
            ),
            child: Demo(),
          ),
        ));
  }
}

class Square extends StatelessWidget {
  final color;
  final size;

  Square({this.color = Colors.black, this.size = 100.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
      child: Icon(
        Icons.find_replace,
        color: Colors.orange,
      ),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Square();
  }
}
