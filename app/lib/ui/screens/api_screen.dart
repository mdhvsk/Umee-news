import 'package:app/core/services/post_service.dart';
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
  PostService postService = PostService();

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
              child: const Text('Get User Test'),
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
              child: const Text('Check env'),
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
                postService.getPosts();
              },
              child: const Text('Check get posts'),
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
                userService.getPosts();
              },
              child: const Text('Check get users'),
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
