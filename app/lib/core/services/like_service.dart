import 'package:app/core/models/like.dart';
import 'package:app/core/models/like_count.dart';
import 'package:app/core/services/supabase_client.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LikeService {
  late SupabaseClient _client;
  bool _isInitialized = false;

  LikeService() {
    _initializeClient();
  }

  Future<void> _initializeClient() async {
    if (!_isInitialized) {
      final instance = await SupabaseClientSingleton.instance;
      _client = instance.client;
      _isInitialized = true;
    }
  }

  Future<LikeModel?> getLike(int userId, int postId) async {
    try {
      final response = await _client
          .from('likes')
          .select()
          .eq('user_id', userId)
          .eq('post_id', postId)
          .single();
      debugPrint(response.toString());
      debugPrint(response.runtimeType.toString());
      LikeModel model = LikeModel.fromJson(response);
      debugPrint(model.runtimeType.toString());
      return model;
    } on PostgrestException catch (error) {
      debugPrint('Error fetching user: ${error.message}');
      return null;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      return null;
    }
  }

  Future<List<LikeModel?>?> getLikes(int postId) async {
    try {
      await _initializeClient();
      final response =
          await _client.from('likes').select().eq('post_id', postId);
      debugPrint(response.toString());
      debugPrint(response.runtimeType.toString());
      List<LikeModel> models =
          response.map((json) => LikeModel.fromJson(json)).toList();
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
  }

  Future<int> getLikeCount(int postId) async {
    try {
      await _initializeClient();
      final response =
          await _client.from('likes').select().eq('post_id', postId);
      debugPrint(response.toString());
      debugPrint(response.runtimeType.toString());
      List<LikeModel> models =
          response.map((json) => LikeModel.fromJson(json)).toList();
      debugPrint(models.runtimeType.toString());
      models.map((model) => debugPrint(model.toString()));
      debugPrint(models.length.toString());
      return models.length;
    } on PostgrestException catch (error) {
      debugPrint('Error fetching user: ${error.message}');
      return 0;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      return 0;
    }
  }

  Future<void> deleteLike(int postId, int userId) async{
    try{
      await _initializeClient();
      final response =
          await _client.from('likes').delete().match({'user_id': userId, 'post_id': postId});
      debugPrint('Like deleted successfully');
      return;
    } on PostgrestException catch (error) {
      debugPrint('Error fetching user: ${error.message}');
      return;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      return;
    }
  }
}
