import 'package:app/core/models/post_card.dart';
import 'package:app/ui/widgets/article_card.dart';
import 'package:flutter/material.dart';

class ArticleListWidget extends StatelessWidget {
  final List<PostCardModel?>? postCardModels;
  const ArticleListWidget({super.key, required this.postCardModels});

  @override
  Widget build(BuildContext context) {
    debugPrint(postCardModels.toString());
    if (postCardModels == null || postCardModels!.isEmpty) {
      return Center(child: Text('No articles available'));
    }
    return SingleChildScrollView(
      child: Column(
        children: postCardModels!
            .where((model) => model != null)
            .map((model) => ArticleCard(key: ValueKey(model!.id), model: model!) as Widget)
            .toList(),
      ),
    );
  }
}