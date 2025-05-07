import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ByTitle extends StatelessWidget {

  const ByTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topCenter,
      child: Column(
 
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const SizedBox(height: 24),
    Text(
         'Sorted by Title',
          style: const TextStyle(
           fontSize: 24,
           fontWeight: FontWeight.bold,                  
          ),
          ),
      const SizedBox(height: 20),
     InkWell(
      onTap: () {
       context.push('/byTitleDetail');
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
            ' Sense and Sensibility\n'
            ' Jane Austen',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        ),
      ),
    ),
    const SizedBox(height: 24),
    InkWell(
      onTap: () {
        context.push('/byTitleDetail');
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
            'Pride and Prejudice\n'
            'Jane Austen',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        ),
      ),
    ),
    const SizedBox(height: 8),
  ],
),
       
       
    );

      
  }
}