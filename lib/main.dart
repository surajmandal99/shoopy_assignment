import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoopy_assignment/provider/chat_provider.dart';
import 'package:shoopy_assignment/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
