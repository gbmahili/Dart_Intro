import 'package:flutter/material.dart';
//https://www.youtube.com/watch?v=u0e2L5yoxFI
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
            // alignment: Alignment.center,
            // width: 200,
            // decoration: BoxDecoration(
            //   border: Border.all(width: 3.0, color: Colors.red),
            //   borderRadius: BorderRadius.all(
            //       Radius.circular(5.0) //         <--- border radius here
            //       ),
            // ),
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
      margin: EdgeInsets.all(5.0),
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

// Using Columns or Rows:
// class Demo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Square();
//   }
// }
// class Demo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,//similar to flex:1 if set to .max
//       mainAxisAlignment: MainAxisAlignment.spaceAround,//similar to justifyContent
//       crossAxisAlignment: CrossAxisAlignment.center, // similar to alignItems
//       children: <Widget>[
//       Square(),
//       Square(size: 200.0,),
//       Square(),
//       Square(),
//     ],);
//   }
// }

// Apply your own direction using FLEX widget
// class Demo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Flex(
//       //direction: Axis.horizontal,//just like direction of 'row' in RN
//       direction:Axis.vertical,//just like direction of column
//       mainAxisSize: MainAxisSize.min,//similar to flex:1 if set to .max
//       mainAxisAlignment: MainAxisAlignment.spaceAround,//similar to justifyContent
//       crossAxisAlignment: CrossAxisAlignment.center, // similar to alignItems
//       children: <Widget>[
//       Square(),
//       Square(size: 200.0,),
//       Square(),
//       Square(),
//     ],);
//   }
// }

// Using Expanding to make some children to take the remaining of the space
// class Demo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: Square(),
//         ), // More like flex:1 or flex:grow...take as much space as you can
//         Square(),
//         Square(),
//         Expanded(
//           flex: 2,
//           child: Square(),
//         ),
//       ],
//     );
//   }
// }

// class Demo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(3.0),
//               child: Text(
//                 'Home',
//               ),
//               height: 40.0,
//               color: Colors.blue,
//             ),
//           ),
//           Expanded(
//             child: Container(
//               child: Text(
//                 'Home',
//               ),
//               height: 40.0,
//               color: Colors.blue,
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(3.0),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(3.0),
//               child: Text(
//                 'Home',
//               ),
//               height: 40.0,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//       Row(children: <Widget>[
//         Text('More')
//       ],),
//     ]);
//   }
// }

// Using Stack: Items are stack up against each other...like position in css
class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height, // device height
      width: MediaQuery.of(context).size.width, // device width
      // alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Square(),
          Positioned(
            top: 20,
            left: 20,
            child: Square(
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Square(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
