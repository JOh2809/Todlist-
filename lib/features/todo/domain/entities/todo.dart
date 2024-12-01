class Todo {
  final int id;
  final String text;
  final String description;

  Todo({
    required this.id,
    required this.text,
    required this.description,
  });

  // Convert Todo to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'description': description,
    };
  }

  // Convert Map to Todo
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      text: map['text'],
      description: map['description'],
    );
  }
}
