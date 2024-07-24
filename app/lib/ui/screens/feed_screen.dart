import 'package:app/core/models/like.dart';
import 'package:app/core/models/post.dart';
import 'package:app/core/models/post_card.dart';
import 'package:app/core/services/like_service.dart';
import 'package:app/core/services/post_card_service.dart';
import 'package:app/core/services/post_service.dart';
import 'package:app/ui/widgets/article_card.dart';
import 'package:app/ui/widgets/nav_bar.dart';
import 'package:app/ui/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  PostService postService = PostService();
  LikeService likeService = LikeService();
  PostCardService postCardService = PostCardService();
  List<PostCardModel?> postCards = [];
  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isFirstLoad) {
      fetchPosts();
    }
    _isFirstLoad = false;
  }

  Future<void> fetchPosts() async {
    try {
      debugPrint("Fetching posts");
      List<PostCardModel?>? retrievedCards = await postCardService.fetchPosts();
      if (retrievedCards != null) {
        setState(() {
          postCards = retrievedCards;
        });
      }
    } catch (e) {
     debugPrint('Exception when fetching posts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Umee Feed"), automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.green,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => postCardService.fetchPosts(),
                  child: Text('Refresh Page'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                // postCards.map((card) => ArticleCard(model: card)).toList()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(selectedIndex: 0),
      extendBody: true,
    );
  }
}
