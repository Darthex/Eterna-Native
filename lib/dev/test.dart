import "dart:math";

var list = ['a','b','c','d','e'];

// generates a new Random object
final _random = Random();

// generate a random index based on the list length
// and use it to retrieve the element

void main() {
  var element = list.toList()..shuffle();
  print(element.sublist(_random.nextInt(list.length)));
}