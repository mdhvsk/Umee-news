// import 'package:app/core/services/supabase_client.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase
  // await SupabaseClientSingleton.instance;
  await dotenv.load(fileName: ".env.${const String.fromEnvironment('FLUTTER_ENV', defaultValue: 'development')}");

  return runApp(const App());
}