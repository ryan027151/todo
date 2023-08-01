class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static Set<ToDo> todoList() {
    return {
      ToDo(id:'01',todoText:'Type your todo'),
      ToDo(id:'02',todoText:'Type your todo'),
      ToDo(id:'03',todoText:'Type your todo')
    };
  }
}
