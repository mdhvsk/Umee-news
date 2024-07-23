// lib/config/supabase_config.dart

import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConfig {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? "";
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? "";
  
  // You might add other configuration constants here
  static const int timeoutDuration = 15; // in seconds
}