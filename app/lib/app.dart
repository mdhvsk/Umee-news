import 'package:app/ui/screens/feed_screen.dart';
import 'package:app/ui/screens/login_screen.dart';
import 'package:app/ui/screens/story_form_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginScreen());
  }
}