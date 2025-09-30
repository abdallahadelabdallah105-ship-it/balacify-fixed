import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
// Firebase imports commented out temporarily
// import 'package:firebase_core/firebase_core.dart';
// import 'core/config/firebase_config.dart';
// import 'core/config/hive_config.dart';
// import 'injection/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Load environment variables
    await dotenv.load(fileName: ".env").catchError((error) {
      debugPrint('No .env file found: $error');
      // Continue without .env file - app can still run
    });
    
    // Initialize Hive for local storage
    await Hive.initFlutter();
    debugPrint('Hive initialized successfully');
    // await HiveConfig.init(); // Uncomment when HiveConfig is implemented
    
    // Firebase temporarily disabled until properly configured
    // TODO: Enable Firebase when ready with proper configuration
    // await Firebase.initializeApp(
    //   options: FirebaseConfig.currentPlatform,
    // );
    debugPrint('Firebase initialization skipped (temporarily disabled)');
    
    // Initialize dependency injection
    // await InjectionContainer.init(); // Uncomment when InjectionContainer is implemented
    
    debugPrint('App initialization completed successfully');
    
  } catch (e) {
    debugPrint('Initialization error: $e');
    // Continue running the app even if some initialization fails
  }
  
  runApp(
    const ProviderScope(
      child: BalacifyApp(),
    ),
  );
}