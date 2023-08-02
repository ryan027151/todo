
class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  ToDo copyWith({
    String? id,
    String? todoText,
    bool? isDone, 
  }) {
    return ToDo(
      id: id ?? this.id,
      todoText: todoText ?? this.todoText,
      isDone: isDone ?? this.isDone,
    );
  }

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Type your todo'),
      ToDo(id: '02', todoText: 'Type your todo'),
      ToDo(id: '03', todoText: 'Type your todo'),
    ];
  }
}
