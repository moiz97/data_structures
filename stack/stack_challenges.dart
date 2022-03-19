import 'stack.dart';

reverseList<E>(List<E> list) {
  var _stack = Stack<E>();
  for (E value in list) {
    _stack.push(value);
  }
  while (_stack.isNotEmpty) {
    print(_stack.pop());
  }
}

bool checkParentheses(String text) {
  var stack = Stack<int>();
  final open = '('.codeUnitAt(0);
  final close = ')'.codeUnitAt(0);
  for (int codeUnit in text.codeUnits) {
    if (codeUnit == open) {
      stack.push(codeUnit);
    } else if (codeUnit == close) {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }

  return stack.isEmpty;
}

void main(List<String> args) {
  //Challenge#1: reverse a list
  final list = [1, 2, 3, 4, 5];
  final string = '(hello world)';
  reverseList(list);
  print(
    checkParentheses(string)
        ? 'Balanced parentheses'
        : 'Unbalanced parentheses',
  );
}
