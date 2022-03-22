class Node<T> {
  T data;
  Node<T>? next;
  Node({required this.data, this.next});
  @override
  String toString() {
    if (next == null) return '$data';
    return '$data -> ${next.toString()}';
  }
}

class Linkedlist<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;
  @override
  Iterator<E> get iterator => _LinkedlistIterator(this);

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node(data: value, next: head);
    if (tail == null) tail = head;
  }

  //This function will always add the value to the end of the list
  void append(E value) {
    if (isEmpty) {
      push(value); //if the list is empty, just push the value
    } else {
      tail!.next =
          Node(data: value); //otherwise, add the value to the end of the list
      tail = tail!.next; //and update the tail
    }
  }

  Node<E>? nodeAt(int index) {
    var currentNode =
        head; //since we need to find a particular node, we need to start at the head to traverse the list
    var currentIndex =
        0; //we need to keep track of the current index(to know where we are in the list)

    //while we haven't reached the end of the list and we haven't reached the index we are looking for
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode; //return the node at the index after the while loop has finished
  }

  Node<E> insertAfter(Node<E> node, E value) {
    //if the node is the tail, we need to update the tail
    if (tail == node) {
      append(value);
      return tail!;
    }
    //otherwise, we need to insert the value after the node
    node.next = Node(data: value, next: node.next);
    return node.next!;
  }

  //This function will remove the node at the front of list i.e head
  E? pop() {
    if (isEmpty)
      return null; //if the list is empty, return null, nothing to pop
    final value = head!.data; //otherwise, save the value of the head
    head = head!.next; //and update the head
    if (head == null)
      tail = null; //if the head is now null, the list is now empty
    return value; //return the value of the head
  }

  //This function will remove the node at the end of the list i.e tail
  void removeLast() {
    if (isEmpty) return; //if the list is empty, return
    if (head == tail) {
      //if the list has only one node, we need to update the head and tail
      head = null;
      tail = null;
    } else {
      var currentNode =
          head; //otherwise, we need to start at the head to traverse the list
      while (currentNode!.next != tail) {
        //while we haven't reached the end of the list
        currentNode = currentNode.next; //keep traversing the list
      }
      currentNode.next =
          null; //when we reach the end of the list, we need to remove the tail
      tail = currentNode; //and update the tail
    }
  }

  //This function will remove the node after a particular node
  E? removeAfter(Node<E> node) {
    final value = node
        .next?.data; //save the value of the node after the node we are removing
    if (node.next == tail) {
      //if the node after the node we are removing is the tail
      tail = node; //we need to update the tail
    }
    node.next =
        node.next?.next; //and update the node after the node we are removing
    return value; //return the value of the node after the node we are removing
  }
}

class _LinkedlistIterator<E> implements Iterator<E> {
  _LinkedlistIterator(Linkedlist<E> list) : _list = list;
  final Linkedlist<E> _list;

  Node<E>? _currentNode;
  @override
  E get current => _currentNode!.data; //return the data of the current node

  bool _firstPass = true; //this will be true the first time we call moveNext
  @override
  bool moveNext() {
    if (_list.isEmpty) return false; //if the list is empty, return false

    if (_firstPass) {
      _currentNode = _list
          .head; //if this is the first pass, we need to set the current node to the head

      _firstPass = false; //and set the first pass to false
    } else {
      _currentNode =
          _currentNode?.next; //otherwise, we need to move to the next node
    }
    return _currentNode != null; //return true if the current node is not null
  }
}

void main(List<String> args) {
  final list = Linkedlist<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print('Orignal list: $list');
  list.insertAfter(list.nodeAt(2)!, 42); //insert after the node at given index
  print('After inserting at index 2: $list');
  list.removeLast(); //remove the last node
  print('After removing last: $list');
  list.pop(); //pop the head
  print('After popping head: $list');
  list.removeAfter(
      list.nodeAt(0)!); //remove the node after the node at given index
  print('After removing after given index: $list');

  final listIterable = Linkedlist<int>(); //create a new list
  listIterable.push(3);
  listIterable.push(2);
  listIterable.push(1);
  for (final element in listIterable) {
    //iterate over the list(Kudos to iterable we implemented above)
    print(element);
  }
}
