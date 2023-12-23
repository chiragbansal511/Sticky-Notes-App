import "package:flutter/material.dart";

class Newicons extends StatelessWidget{
  final Color bgcolor ;
  final IconData data ;
     
    Newicons({required this.bgcolor , required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(color: bgcolor , shape: BoxShape.circle),
      child: Icon(data , color: Colors.white, size: 40,),
    );
  }
}