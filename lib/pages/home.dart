import 'package:flutter/material.dart';
import 'byauthor.dart';
import 'bytitle.dart';
import 'profile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();

}
class _HomePageState extends State<HomePage>{

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
       body: Container(
        color: Colors.white, // 你想要的背景色
        
      ),
bottomNavigationBar: BottomNavigationBar(
  
  onTap: (index) {
     // 避免重复跳转

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