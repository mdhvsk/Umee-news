import 'package:app/core/services/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostService{
  late SupabaseClient _client;

  PostService() {
    _initializeClient();
  }

  Future<void> _initializeClient() async {
    final instance = await SupabaseClientSingleton.instance;
    _client = instance.client;
  }

  


}