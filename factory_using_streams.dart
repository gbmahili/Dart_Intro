// Using the async for streams
import 'dart:async';

// Using Chocolate Cake Analogy:
/**
 * 1. Customer gives a CHOCOLATE CAKE order to the Order Taker
 * 2. Order Taker passes that order to the Order Inspector in the factory
 * 3. Order Inspector take the 'TYPE' of cake being ordered and passes it to the Baker
 * 4. Baker checks if 'TYPE' of order is 'CHOCOLOTE', 
 *    - If yes, bakes cake and send to Pickup Office
 *    - If no, create error and send to Pickup Office
 * 5. Customer comes to the Pickup Office and either gets the cake or the error.
 */
class Cake{}
// Order to hand off to the factory
class Order{
  String type;
  Order(this.type);
}

void main() {
  // Start the process of creating a stream
  final controller  = new StreamController();
  // StreamController comes with two methods:
  // 1. sink: This can be considered as our Order Taker from our chocolate cake analogy
  
  final order = new Order('chocolate');
  final baker = new StreamTransformer.fromHandlers(
    handleData: (cakeType, sink) {
      if(cakeType == 'chocolate') {
        sink.add(new Cake());
      } else {
        sink.addError("I can't bake that type of cake");
      }
    }
  );
  controller.sink.add(order);// add type to stream

  // 2. stream: This is the cake factory Order Inspector who will take off the type of the cake
  controller.stream
    .map((order)=> order.type)//using the stream, we check for the type and pass it to our baker
    .transform(baker)// Our baker function checks if the type is 'chocolate' and produces a cake or an error
    .listen(
      (cake) => print('Here is your cake'),// only when we got the cake
      onError: (err) => print(err) // Only when there was en error
    );
}