import 'package:flutter/material.dart';
import 'package:todo3/constants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;

  const ToDoItem({Key? key, required this.todo, required this.onToDoChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ), //RoundedRectangleBorder
        tileColor: charcoal,
        leading: Icon(
          todo.isDone ? Icons.check_box :Icons.check_box_outline_blank,
          color: denim,
        ),
        title: Text(
          todo.todoText!,
          style:TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(149, 149, 148, 1),
            decoration: todo.isDone? TextDecoration.lineThrough:null,
          ), //Textstyle
        ), //Text
      ), //Listile
    ); //Container
  }
}
