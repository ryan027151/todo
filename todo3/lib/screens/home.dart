import 'package:flutter/material.dart';
import 'package:todo3/constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: charcoal,
      appBar: _buildAppBar(), //AppBar
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 100,
                    bottom: 10,
                  ), //EdgeInsets.only
                  child: const Text(
                    "  Today's 3s",
                    style: TextStyle(
                      color: cashmere,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ), //Textstyle
                  ), //Text
                ), //Container
                Divider(
                  height: 10,
                  indent: 15,
                  endIndent: 100,
                  color: cashmere,
                  thickness: 1,
                ),//divider
                for (ToDo todoo in todosList)
                  ToDoItem(
                    todo: todoo,
                    onToDoChanged: _handleToDoChange,
                  ),
              ],
            ) //Listview
                ) //Expanded
          ],
        ), //Column
      ), //Container
    ); //Scaffold
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone == !todo.isDone;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: charcoal,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.menu,
          color: cashmere,
          size: 30,
        ), //Icon
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.jpeg'),
          ), //ClipRRect
        ), //Container
      ]), //Row
    );
  }
}
