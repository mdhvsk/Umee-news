import 'package:app/core/models/post.dart';
import 'package:app/core/services/supabase_client.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostService {
  late SupabaseClient _client;
  bool _isInitialized = false;

  PostService() {
    _initializeClient();
  }

  Future<void> _initializeClient() async {
    if (!_isInitialized) {
      final instance = await SupabaseClientSingleton.instance;
      _client = instance.client;
      _isInitialized = true;
    }
  }

  Future<List<PostModel?>?> getPosts() async {
    try {
      await _initializeClient();
      final response = await _client.from('posts').select();
      debugPrint(response.toString());
      debugPrint(response.runtimeType.toString());
      List<PostModel> models =
          response.map((json) => PostModel.fromJson(json)).toList();
      debugPrint(models.runtimeType.toString());
      models.map((model) => debugPrint(model.toString()));
      return models;
    } on PostgrestException catch (error) {
      debugPrint('Error fetching user: ${error.message}');
      return null;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      return null;
    }

    // Handle the response
  }
}
