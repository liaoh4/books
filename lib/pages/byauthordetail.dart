import 'package:flutter/material.dart';

class ByAuthorDetail extends StatelessWidget {
  
  const ByAuthorDetail ({super.key});
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: Text("Book",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )),
        ),

      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0), 
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
           const Text(
            "Detail of the author",
            style: TextStyle(
             fontSize: 18,
          color:Colors.grey,
        ),
      ),
    ],
  ),
)

);
            
      
  }
}