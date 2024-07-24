import 'package:app/core/models/post.dart';
import 'package:app/core/models/post_card.dart';
import 'package:app/core/services/post_service.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  final PostCardModel model;

  const ArticleScreen({super.key, required this.model});
  @override
  State<ArticleScreen> createState() => _ArticleScreenState(model);
}

class _ArticleScreenState extends State<ArticleScreen> {
  PostCardModel _model;

  _ArticleScreenState(this._model);

  // PostModel fetchPost(){

  // }
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
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.favorite_border, color: Colors.black),
        //     onPressed: () {},
        //   ),
        //   const SizedBox(width: 8),
        //   const Text(
        //     '1.2K',
        //     style: TextStyle(color: Colors.black, fontSize: 16),
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.share, color: Colors.black),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _model.createdAt.substring(0, 10),
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                _model.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/2048px-Default_pfp.svg.png"),
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _model.firstName + " " + _model.lastName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Author', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_model.imageUrl != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    _model.imageUrl!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              ] else ...[
                const SizedBox(height: 8),
              ],
              const SizedBox(height: 16),
              Text(
                _model.content
              ),
              const SizedBox(height: 16),
              // Container(
              //   padding: const EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[200],
              //     borderRadius: BorderRadius.circular(8),
              //   ),
    
              // ),
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
