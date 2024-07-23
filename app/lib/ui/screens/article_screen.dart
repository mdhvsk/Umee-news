import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          const Text(
            '1.2K',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nov 21, 2023 • 10 Mins read',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 8),
              const Text(
                'Some examples of computer set up that suits to your styles. Minimalist with modern touch',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://example.com/placeholder.jpg'),
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eren Yaeger',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('DESIGN', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://example.com/desk-setup.jpg',
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "So you've got a new computer. Awesome! That humble metal box is the key to a wide world of potential. It can help you with everything from juggling your family to blowing off some steam on, uh, Steam.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "But a new PC isn't like a new car; you can't just turn a key and put the pedal to the metal. Okay, maybe you can—but you shouldn't. Performing just a few simple activities when you first fire it up can help it be safer, faster, and better poised for the future.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconButton(Icons.search, 'Search on web'),
                    _buildIconButton(Icons.copy, 'Copy'),
                    _buildIconButton(Icons.translate, 'Translate'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
