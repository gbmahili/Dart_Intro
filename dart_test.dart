// 1. --------------------------------- INTRO ------------------------------------
//Entry Point
void main(){
  
  var name = "Baraka";
  var age = 37;
  const height = 1.54;
  
  describe(name, age, height);
  print("--------------------");
  describe("Georges", 27, 1.69);
  print("--------------------");
  final newLine = describe1(name, age, height);
  print(newLine);
  print("--------------------");
  final newLine2 = describe2(height: 1.66, name:'Mahili', age:36 );
  print(newLine2);
  
}

// Function that returns nothing starts with Void:
void describe(String name, int age, double height) {
  print("Hello, I'm $name");
  print("Hello, I'm $age");
  print("Hello, I'm $height");
}

// Returns a string
String describe1(String name, int age, [double height = 0.0]) {
  return "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
}
// Arrow Functions
String describe2({String name, int age, double height = 0.0}) => "Hello, I'm $name. I'm $age years old. I'm $height meters tall";


//2. -----------------------------------------FUNCTIONS AND CLASSES --------------------------------
void main(){
  
//   var name = "Baraka";
//   var age = 37;
//   const height = 1.54;
  
//   describe(name, age, height);
//   print("--------------------");
//   describe("Georges", 27, 1.69);
//   print("--------------------");
//   final newLine = describe1(name, age, height);
//   print(newLine);
//   print("--------------------");
//   final newLine2 = describe2(height: 1.66, name:'Mahili', age:36 );
//   print(newLine2);
  
  // Create an instance of a class:
  final person = Person(name: 'Georges', age: 33, height:1.54);
  person.name = 'Georges';
  person.age = 37;
  print(person.name);
  print(person.age);
  
  person.describe();
  
  final employee = Employee(name: 'Georges', age: 33, height:1.54, taxCode: 'AB12', salary:50000);
  final sayHiString = employee.sayHi();
  print(sayHiString);
  print("--------------------");
  print(employee.toString());
  
}

//Definining Classes:
class Person {
  Person({this.age, this.height, this.name}); // constructor
  String name; // types must be declared when in class
  int age;
  double height;
  
  // Function that returns nothing starts with Void:
  void describe() {
    print("Hello, I'm $name");
    print("Hello, I'm $age");
    print("Hello, I'm $height");
  }

  // Returns a string
  String describe1() {
    return "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
  }
	// Arrow Functions
	String describe2() => "Hello, I'm $name. I'm $age years old. I'm $height meters tall";
  
  // Returns hi
  String sayHi() => 'Hello, call me $name';
  
  // Ovveride a dart method such as .toString()
  @override
  String toString() => 'I am overring the toString object method';

}

class Employee extends Person {
  Employee({String name, int age, double height, this.salary, this.taxCode}) : super(name:name, age:age, height:height);
  final String taxCode;
  final int salary;
  @override
  String toString() => "${super.toString()}...now Employee is also overriding what is in Person";
}

// 3. ----------------------- CLASSES, GETTERS, IMPORTS, ABSTRACT --------------------------
import 'dart:math';// it contains a lot of math features, such as pi

void main() {
  final square = Square(side:10.0);
  printArea(square);
  final circle = Circle(radius: 5.0);
  printArea(circle);
}

// This function accepts any shape because Shape is an abstract class
// 1. Using stored property called area:
// void printArea(Shape shape) {
//   print(shape.area());
// }
// 2.Using computed property
void printArea(Shape shape) {
  print(shape.area);
}

//Abstract Classes: create an interface...and we can write code that uses this shape class even though it is not emplemented
// The other classes will implement what happens with this class;
//1. Using stored property called area:
// abstract class Shape {
//   double area();
// }
// 2.Using computed property
abstract class Shape {
  double get area;
}

// This class implements what happens witht the Shape:
//1. Using stored property called area:
// class Square implements Shape {
//   Square({this.side});
//   final double side;
//   double area() => side * side;
// }

// 2.Using computed property
class Square implements Shape {
  Square({this.side});
  final double side;
  double get area => side * side;
}
// This class implements what happens witht the Shape
//1. Using stored property called area:
// class Circle implements Shape {
//   Circle({this.radius});
//   final double radius;
//   double area() => radius * radius * pi;
// }
// 2.Using computed property
class Circle implements Shape {
  Circle({this.radius});
  final double radius;
  double get area => radius * radius * pi;
}

//4. ----------------------- GENERIC ---------------------
void main() {
  //List...or as we call it in JS: Arrays
  var primeNumbers = [2, 3, 5, 7];
  primeNumbers.addAll([11, 13,17, 19]);//pushing new values to the list (or array);
  primeNumbers.add(23);//pushing one value to the list;
  print(primeNumbers);
  
  Map...or as we call it in JS: Object
  var person = {
    'name': 'Baraka',
    'age': 34,
    'height': 1.54
  };
  print(person['name']); //returns Baraka
  //print(person.name);// Can not do this
  print(person['weight']); // null ...because the key does not exist
  person['weight'] = 60;// Add key value to the map
  print(person['weight']); // 60 ...because the key has been added
  print(person.containsKey('name'));//returns true
  
  Generics:  this is a way for improving type safety...safer code
  Define a list with types:
  
  var primeNumbers = List(); // its like declaring primeNumbers = [];
  primeNumbers.addAll([2, 3, 5, 7]);
  primeNumbers.add('Baraka');// this can be added because we are not specifying that our primeNumbers should only accept int
  print(primeNumbers);
  
  var primeNumbers2 = List<int>(); // Here, we are explicitely saying that our List should only accept integers...not string;
  primeNumbers2.addAll([2, 3, 5, 7]);
  //primeNumbers2.add('Baraka');// this can NOT be added because we are specifying that our primeNumbers2 should only accept int
  primeNumbers2.add(11);// this can be added because we are specifying that our primeNumbers2 should only accept int
  print(primeNumbers2);
  
   var person = <String, dynamic>{//here, we are saying that the map will have a key of type String, and the key value can be of any type
    'name': 'Baraka',
    'age': 34,
    'height': 1.54
  };
  print(person['name']);
  
  // function that returns first 4 prime numbers
  List<int> getFourPrimeNumbers() => [2, 3, 4, 7];//this function can only return a list of integers.
  
    
}

// Control Flow
void main() {
  printOddEven(5);
  printOddEven2(2);
  final values = [1, 3, 5, 7, 8, 9, 5];
  print('Sum is ${sum(values)}');
}

// 1. If Statements
// a function that prints whether a value is even or odd
void printOddEven(int value) {
  if(value % 2 == 0) {
    print('$value is even');
  } else {
    print('$value is odd');
  }
}
// Shorter version using a ternary operator:
void printOddEven2(int value) {
  final typeOfValue = (value % 2 == 0) ? 'even' : 'odd';
  print('$value is $typeOfValue');
}

//2. While loops
// a function that returns an integer, it takes in a list (array) of integers..this functions adds up all the values in a list
int sum(List<int> values) {
//   int i = 0;
//   int result = 0;
  //while loop
//   while(i < values.length) {
//     result += values[i];
//     i++;
//   }
  //for loop
//   for(int i=0; i < values.length; i++) {
//     result += values[i];
//   }
  //for in
//   for (int value in values) {
//     result += value;
//   }
//   return result;
  
  // Can alos use one line to add everything in the list...this is called reduce in JS
  return values.fold(0, (result, value) => result + value);//this is like array.reduce((a, b) => a+b)
}