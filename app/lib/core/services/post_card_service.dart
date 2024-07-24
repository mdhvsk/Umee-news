import 'package:app/core/models/like.dart';
import 'package:app/core/models/post.dart';
import 'package:app/core/models/post_card.dart';
import 'package:app/core/models/user.dart';
import 'package:app/core/services/image_service.dart';
import 'package:app/core/services/like_service.dart';
import 'package:app/core/services/post_service.dart';
import 'package:app/core/services/supabase_client.dart';
import 'package:app/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostCardService {
  late SupabaseClient _client;
  bool _isInitialized = false;
  PostService postService = PostService();
  LikeService likeService = LikeService();
  UserService userService = UserService();
  ImageService imageService = ImageService();

  PostCardService() {
    _initializeClient();
  }

  Future<void> _initializeClient() async {
    if (!_isInitialized) {
      final instance = await SupabaseClientSingleton.instance;
      _client = instance.client;
      _isInitialized = true;
    }
  }

  Future<List<PostCardModel?>?> fetchPosts() async {
    try {
      List<PostCardModel> postCardModels = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('user_id');

      if (userId == null) {
        return null;
      }
      List<PostModel?>? articleModels = await postService.getPosts();

      for (int i = 0; i < articleModels!.length; i++) {
        int postId = articleModels[i]!.id;
        String title = articleModels[i]!.title;
        String content = articleModels[i]!.content;
        String created_at = articleModels[i]!.created_at.toIso8601String();
        String? image_id = articleModels[i]!.image_id;
        if (postId == null) continue;
        // debugPrint("$postId, $title, $content, $created_at, $image_id");
        int likeCount = 0;
        likeCount = await likeService.getLikeCount(articleModels[i]!.id);
        debugPrint(likeCount.toString());
        bool? isLiked =
            await likeService.getLike(userId, articleModels[i]!.id);
        if (isLiked == null) isLiked = false;

        UserModel? user = await userService.getUserById(userId);
        if (user == null) {
          debugPrint("no user");
          continue;
        };
        String first_name = user.firstName;
        String last_name = user.lastName;

        String? image_url = null;
        if (image_id != null) {
          image_url = await imageService.getImageSignedUrl(image_id);
        }

        PostCardModel newModel = PostCardModel(
            id: postId,
            userId: userId,
            title: title,
            content: content,
            createdAt: created_at,
            firstName: first_name,
            lastName: last_name,
            imageUrl: image_url,
            likeCount: likeCount,
            isLiked: isLiked);

        postCardModels.add(newModel);
      }
    debugPrint(postCardModels.toString());
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
