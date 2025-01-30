import 'package:flutter/material.dart';

import 'calculator_page.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home") ,
        backgroundColor:Colors.cyanAccent ,
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: [
          Text("My Fitness"),
          Image.asset("lib/assets/images/pexels-victorfreitas-841130.jpg"),
         SizedBox(height: 50),
          ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Calculator())) ;
          },
              child: Text("Enter") )
        ],
      ) ,
    );
  }
}
