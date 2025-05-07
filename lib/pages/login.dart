import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {

  const Login({super.key});
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: const Text(
        "Log In",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ),
    
    body: Container(
      color: Colors.white, // ✅ 设置背景色（你可以改成任何颜色）
      alignment: Alignment.center, // ✅ 保持内容居中
      child: SizedBox(
        width: 150,
        child: FilledButton(
          onPressed: () {
            context.go('/byAuthor');
          },
          style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 170, 131, 182),
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
          ),
          child: const Text('Login'),
        ),
      ),
    ),
      );
      
  }
}