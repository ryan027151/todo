import 'package:flutter/material.dart';
import 'package:todo3/constants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final  onToDoChanged;
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
          Checkbox(
            value: widget.todo.isDone,
            onChanged: (bool? newValue) {
              widget.onToDoChanged(widget.todo.copyWith(isDone: newValue));
            },
            activeColor: denim,
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
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromRGBO(149, 149, 148, 1),
                        decoration:
                            widget.todo.isDone ? TextDecoration.lineThrough : null,
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
                          color: const Color.fromRGBO(149, 149, 148, 1),
                          decoration:
                              widget.todo.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
