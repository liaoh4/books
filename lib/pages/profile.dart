import 'package:books/pages/home.dart';
import 'package:flutter/material.dart';
import 'login.dart';





class Profile extends StatelessWidget {

  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: const Text(
        "Profile",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    ),
    
    body: Center( 
      child:SizedBox(
        width:150,
      child:FilledButton( 
      onPressed: () {
      Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => const Login()),
  (Route<dynamic> route) => false,
);

    },
      style: FilledButton.styleFrom(    
      backgroundColor: const Color.fromARGB(255, 170, 131, 182), 
      foregroundColor:Colors.white,
      side: const BorderSide(color: Colors.white),
       ),
      child: const Text('Logout'),
      ),
      ),
    ),
      );
      
  }
}