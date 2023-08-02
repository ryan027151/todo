import 'package:flutter/material.dart';
import 'package:todo3/constants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  
  const ToDoItem({Key? key, required this.todo, required this.onToDoChanged})
      : super(key: key);

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.todo.todoText!;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          StatefulBuilder(
            builder: (context, setState) =>Checkbox(
            value: widget.todo.isDone,
            activeColor: denim,
            onChanged: (newValue) {
              setState(() {
                widget.todo.isDone = !widget.todo.isDone;
            });
              }
              ),
          ),
          
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isEditing = true;
                });
              },
              child: _isEditing
                  ? TextField(
                      controller: _textEditingController,
                      onSubmitted: (value) {
                        setState(() {
                          _isEditing = false;
                          widget.onToDoChanged(
                            widget.todo.copyWith(todoText: value),
                          );
                        });
                      },
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(149, 149, 148, 1),
                      ),
                    )
                  : ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tileColor: charcoal,
                      title: Text(
                        widget.todo.todoText!,
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 149, 148, 148),
                          decoration: widget.todo.isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
