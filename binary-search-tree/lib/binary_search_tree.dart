class BinarySearchTree {
  late Node root;

  BinarySearchTree(String initialData) {
    root = Node(initialData);
  }

  void insert(String data) {
    root.insert(data);
  }

  List<String> get sortedData {
    return root.sortedData;
  }
}

class Node {
  final String data;
  Node? left;
  Node? right;

  Node(this.data);

  void insert(String newData) {
    if (newData.compareTo(data) <= 0) {
      if (left == null)
        left = Node(newData);
      else
        left!.insert(newData);
    } else {
      if (right == null)
        right = Node(newData);
      else
        right!.insert(newData);
    }
  }

  List<String> get sortedData {
    List<String> leftData = left?.sortedData ?? [];
    List<String> rightData = right?.sortedData ?? [];

    return [...leftData, data, ...rightData];
  }
}
