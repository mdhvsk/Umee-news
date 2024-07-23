import 'package:app/ui/widgets/nav_bar.dart';
import 'package:app/ui/widgets/post_card.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Umee Feed"), automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          child: const SingleChildScrollView(
            child: Column(
              children: [PostCard(), PostCard(), PostCard(), PostCard()],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(selectedIndex: 0),
    extendBody: true,
    );
  }
}
