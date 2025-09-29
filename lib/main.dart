import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
// import 'core/config/firebase_config.dart';
// import 'core/config/hive_config.dart';
// import 'injection/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Load environment variables (optional for now)
    await dotenv.load(fileName: ".env").catchError((error) {
      debugPrint('No .env file found: $error');
    });
    
    // Initialize Hive
    await Hive.initFlutter();
    // await HiveConfig.init(); // Uncomment when HiveConfig is implemented
    
    // Initialize Firebase (with default options for now)
    await Firebase.initializeApp(
      // options: FirebaseConfig.currentPlatform, // Uncomment when FirebaseConfig is implemented
    );
    
    // Initialize dependency injection
    // await InjectionContainer.init(); // Uncomment when InjectionContainer is implemented
    
  } catch (e) {
    debugPrint('Initialization error: $e');
  }
  
  runApp(
    const ProviderScope(
      child: BalacifyApp(),
    ),
  );
}