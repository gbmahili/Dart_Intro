// convert includes a method to work with json
import 'dart:convert';

void main() {
  // Sample json data
  var rawJson = '{"url": "http://something.jpg", "id": 1}';
  // To parse the data into a json file, we use the decode from json
  var parsedJson = json.decode(rawJson);
  print('-----------From Json Data Directly, no constructors--------------');
  print(parsedJson['url']); //http://something.jpg
  
  // Using the class to work with Json
  var imageModel = new ImageModel(parsedJson['id'], parsedJson['url']);
  // Now we can access the values using the dot notation
  print('-----------From Constructor--------------');
  print(imageModel.id);

  /**
   * As you can see, if we had a json containing about keys, we will have to pass all those keys in our ImageModel:
   *  = new ImageModel(parsedJson['id'], parsedJson['url'], parsedJson['some_other_id...etc]);
   * 
   * This is where named contructors come in handy...it is impleted in the class as a second constructor or first if you wish
   * and defines all keys that will be needed when called
   */
  var anotherImageModel = new ImageModel.fromJson(parsedJson);
  print('-----------From Named Constructor--------------');
  print(anotherImageModel.url);

}

// Since DART is a typed language, we can create some class model to dictate what type of data our json will have
class ImageModel {
  int id;
  String url;
  // Add a normal constructor
  ImageModel(this.id, this.url);

  // You can also add a named Constructor...especially when working with objects
  ImageModel.fromJson(parsedData) {
    id = parsedData['id'];
    url = parsedData['url'];
  }
}