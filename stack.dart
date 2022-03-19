class Stack<E> {
  Stack() : _storage = <E>[];
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
}
