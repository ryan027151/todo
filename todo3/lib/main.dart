import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class Todo {
  String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final Map<String, List<Todo>> _todosByDay = {};

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _loadTodos();
  }

  void _loadTodos() {
    // Load todos from shared preferences and update the _todosByDay map
    // For example, you can use json.decode to convert the data stored in shared preferences.
  }

  void _saveTodos() {
    // Save todos to shared preferences
    // For example, you can use json.encode to convert the _todosByDay map to a string and then save it.
  }

  void _addTodoForDay(String date, String todoTitle) {
    setState(() {
      if (_todosByDay[date] == null) {
        _todosByDay[date] = [];
      }
      if (_todosByDay[date]!.length < 3) {
        _todosByDay[date]!.add(Todo(title: todoTitle));
        _saveTodos();
      } else {
        // Show a message or alert indicating that the limit of three todos has been reached for this day.
      }
    });
  }

  Widget _buildTodoListForDay(String date) {
    return ListView.builder(
      itemCount: _todosByDay[date]?.length ?? 0,
      itemBuilder: (context, index) {
        Todo todo = _todosByDay[date]![index];
        return ListTile(
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (value) {
              setState(() {
                todo.isDone = value ?? false;
                _saveTodos();
              });
            },
          ),
          title: Text(todo.title),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Minimalistic Todo App'),
        ),
        body: _buildTodoListForDay('2023-07-27'), // Replace this with the current date or a selected date.
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addTodoForDay('2023-07-27', 'Sample Todo'); // Replace this with the current date or a selected date.
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
