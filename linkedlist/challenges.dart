import 'linkedlist.dart';

//to solve this problem we will use runners technique i.e you point both refrences to head (slow and fast) the fast traverse the list and the slow traverse the list and when the fast reaches the end of the list, the slow will be at the middle of the list
Node<E>? getMiddle<E>(Linkedlist<E> list) {
  var slow = list.head;
  var fast = list.head;
  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }
  return slow;
}

void _reverseList(list) {
  print('Printing list in reverse');
  while (list.isNotEmpty) {
    print(list.pop().toString());
  }
}

void main(List<String> args) {
  var list = Linkedlist<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print("Orignal list: " + list.toString() + '\n');

  //Challenge#2: find the middle node of the list
  final middleNode = getMiddle(list);
  print('\nMiddle node: ${middleNode?.data}\n');

  //Challenge#1: reverse a list
  _reverseList(list);
}
