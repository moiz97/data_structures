abstract class Queue<E> {
  bool enqueue(E element); // Enqueue element at the end of the queue.
  E? dequeue(); // Remove and return the first element of the queue.
  bool? get isEmpty; // Return true if the queue is empty.
  int length(); // Return the number of elements in the queue.
  E? get peek; // Return the first element of the queue without removing it.
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  E? dequeue() => _list.isEmpty ? null : _list.removeAt(0);

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.isEmpty ? null : _list.first;

  @override
  length() => _list.length;

  @override
  String toString() => _list.toString();
}

void main(List<String> args) {
  QueueList _ticketQueue = QueueList();
  _ticketQueue.enqueue('Ryan');
  _ticketQueue.enqueue('John');
  _ticketQueue.enqueue('Tom');
  _ticketQueue.enqueue('Bob');
  print('Orignal queue: ' + _ticketQueue.toString());
  print('First element: ' + _ticketQueue.peek.toString());
  print('Dequeue: ' + _ticketQueue.dequeue().toString());
  print('Queue after dequeue: ' + _ticketQueue.toString());
}
