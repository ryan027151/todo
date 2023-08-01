import 'package:flutter/material.dart';
import 'package:todo3/constants/colors.dart';


class Home extends StatelessWidget{
  const Home({Key? key}) : super(key:key);

  @ override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: charcoal,
      appBar:_buildAppBar(),//AppBar
      body:Container(
        child:Column(
          children:[
            Expanded(
            child:ListView(
              children: [
                Container(
                  margin:const EdgeInsets.only(
                    top:50,
                    bottom:20,
                    ), //EdgeInsets.only
                  child:const Text(
                    "To do",
                     style:TextStyle(
                      fontSize:30,
                      fontWeight: FontWeight.w500,
                    ), //Textstyle
                  ), //Text
                ), //Container
              ],
            ) //Listview
            ) //Expanded
          ],
        ),//Column
      ), //Container
    );//Scaffold
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor:charcoal,
      elevation:0,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        const Icon(
          Icons.menu,
          color:cashmere,
          size:30,
        ),//Icon
        Container(
          height:40,
          width:40,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:Image.asset('assets/images/avatar.jpeg'),
          ),//ClipRRect
        ),//Container
      ]),//Row
    );
  }
}