void arrays() {
  List<String> names = ['Seth', 'Kathy', 'Lars'];
  List<String> otherName = ['a', 'b', 'c'];
  names
    ..add(
      "20",
    )
    ..addAll(otherName)
    ..any((element) => element.contains("a"));
  print("arrays: " + names.toString());
}

void main() {
  arrays();
  print('----------------------------------------------------------------');
}
