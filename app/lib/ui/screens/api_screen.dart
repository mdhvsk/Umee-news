import 'package:app/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("api testing")),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                userService.getUser("new_user");
              },
              child: const Text('Login to Mobillet'),
              style: ElevatedButton.styleFrom(
                iconColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint(dotenv.get("SUPABASE_URL"));
              },
              child: const Text('Login to Mobillet'),
              style: ElevatedButton.styleFrom(
                iconColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ));
  }
}
