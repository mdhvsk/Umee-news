import 'package:app/core/models/post_card.dart';
import 'package:app/ui/screens/article_screen.dart';
import 'package:flutter/material.dart';



class ArticleCard extends StatefulWidget {

  final PostCardModel model;
  // const ArticleCard({super.key});

  const ArticleCard({super.key, required this.model});

  @override
  State<ArticleCard> createState() => _ArticleCardState(model);
}

class _ArticleCardState extends State<ArticleCard> {
  PostCardModel _model;
  _ArticleCardState(this._model);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(239, 240, 240, 1),
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/2048px-Default_pfp.svg.png'),
            ),
            title: Text(_model.firstName),
            subtitle: Text(_model.createdAt),
            trailing: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ),
          GestureDetector(
            onLongPress: () => _viewStory(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Image.network(
              //     _model.imageUrl,
              //     fit: BoxFit.fill,
              //     height: 200,
              //     width: double.infinity),
            ),
          ),

          GestureDetector(
            onLongPress: () => _viewStory(context),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _model.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _viewStory(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const ArticleScreen()),
  );
}