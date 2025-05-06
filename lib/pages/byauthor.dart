import 'package:flutter/material.dart';
import 'bytitledetail.dart';
import 'byauthordetail.dart';
import 'profile.dart';
import 'byTitle.dart';
import 'byauthor.dart';


class ByAuthor extends StatelessWidget {

  const ByAuthor({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: const Text(
        "Books",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    ),
       body: Align(
      alignment: Alignment.topCenter,
      child: Column(
 
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const SizedBox(height: 24),
    Text(
         'Sorted by Author',
          style: const TextStyle(
           fontSize: 24,
           fontWeight: FontWeight.bold,                  
          ),
          ),
      const SizedBox(height: 20),
     InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ByAuthorDetail()),
        );
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ByAuthorDetail()),
        );
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
       ),
       bottomNavigationBar: BottomNavigationBar(
  
  onTap: (index) {
    

    Widget nextPage;
    switch (index) {
      case 0:
        nextPage = const ByAuthor();
        break;
      case 1:
        nextPage = const ByTitle();
        break;
      case 2:
        nextPage = const Profile();
        break;
      default:
        nextPage = const ByAuthor();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'By Author',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.text_fields),
      label: 'By Title',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Profile',
    ),
  ],
),
    );

      
  }
}