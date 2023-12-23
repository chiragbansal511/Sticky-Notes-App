import 'package:flutter/material.dart';
import 'package:testapp/components/icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       actions: [TextButton(onPressed: ()=>{}, child: const Text("Edit" , style: TextStyle(color: Colors.white , fontSize: 20),),)],
      ),
       
       body: Container(
        child:  Column(
          children: [
             Expanded(flex:1, child: GridView.count(crossAxisCount: 2 ,padding: EdgeInsetsDirectional.all(10) , mainAxisSpacing: 10,crossAxisSpacing: 10, children: [
              Container(child: Container(padding: EdgeInsetsDirectional.all(10), color: const Color.fromARGB(255, 36, 35, 35), child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Newicons(bgcolor: Colors.blue, data: Icons.calendar_month) , Text("0" , style: TextStyle(fontSize: 50 , fontWeight:FontWeight.bold , color: Colors.white),)],), Text('Today',style : TextStyle(fontSize: 25 , fontWeight:FontWeight.bold , color: Colors.white))],))),
              Container(child: Container(padding: EdgeInsetsDirectional.all(10), color: const Color.fromARGB(255, 36, 35, 35), child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Newicons(bgcolor: Colors.green, data: Icons.calendar_today) , Text("0" , style: TextStyle(fontSize: 50 , fontWeight:FontWeight.bold , color: Colors.white),)],), Text('Sheduled',style : TextStyle(fontSize: 25 , fontWeight:FontWeight.bold , color: Colors.white))],))),
              Container(child: Container(padding: EdgeInsetsDirectional.all(10), color: const Color.fromARGB(255, 36, 35, 35), child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Newicons(bgcolor: Colors.orange, data: Icons.flag) , Text("0" , style: TextStyle(fontSize: 50 , fontWeight:FontWeight.bold , color: Colors.white),)],), Text('All',style : TextStyle(fontSize: 25 , fontWeight:FontWeight.bold , color: Colors.white))],))),
              Container(child: Container(padding: EdgeInsetsDirectional.all(10), color: const Color.fromARGB(255, 36, 35, 35), child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Newicons(bgcolor: Colors.red, data: Icons.phone) , Text("0" , style: TextStyle(fontSize: 50 , fontWeight:FontWeight.bold , color: Colors.white),)],), Text('Flaged',style : TextStyle(fontSize: 25 , fontWeight:FontWeight.bold , color: Colors.white))],))),
             
             ],)),
             
             Container(
             child: Row(children: [
              TextButton.icon(onPressed: ()=>{}, icon: Icon(Icons.add_circle), label: Text("Add Reminder" ,style : TextStyle(color: Colors.white))),
              TextButton.icon(onPressed: ()=>{}, icon: Icon(Icons.list_alt_rounded), label: Text("Add List" ,style : TextStyle(color: Colors.white )))
             ],
             mainAxisAlignment: MainAxisAlignment.spaceBetween,)),
          ],
        ),
       ),
    );
  }
}
