class Stack<E> {
  Stack() : _storage = <E>[];
  Stack.of(Iterable<E> elements)
      : _storage = List<E>.of(
            elements); //this constructor will be used to convert any kind of iterable into a stack
  final List<E> _storage;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n--- Bottom ---';
  }

  //check if stack is empty
  bool get isEmpty => _storage.isEmpty;
  //check if stack is empty or not
  bool get isNotEmpty => !isEmpty;
  //peek: look at the top element without mutating it's content
  E get peek => _storage.last;
  //push element to  the stack
  void push(E element) => _storage.add(element);
  //pop element from the stack
  E pop() =>
      isEmpty ? throw Exception('Stack is empty') : _storage.removeLast();
}

void main(List<String> args) {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  print("Orignal stack: \n" + stack.toString());
  final element = stack.pop();
  print("Popped: $element");
  print("Stack after pop operation: \n" + stack.toString());
  final topElement = stack.peek;
  print("Top element accessed using peek: $topElement");

  //converting any iterable into a stack
  const list = [1, 2, 3, 4, 5];
  final stackFromList =
      Stack.of(list); //remember the constructor we created in Stack class?
  print("Stack from list: \n" + stackFromList.toString());
}
