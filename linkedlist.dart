class Node<E> {
  Node({required this.data, this.next});
  E data;
  Node<E>? next;
  @override
  String toString() {
    if (next == null) return '$data';
    return '$data -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node(data: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(data: value);
    tail = tail!.next;
  }
}

void main(List<String> args) {
  final list = LinkedList<int>();
  list.append(1);
  list.append(2);
  list.append(3);

  print(list);
}
