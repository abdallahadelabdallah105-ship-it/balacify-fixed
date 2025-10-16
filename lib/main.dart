import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'app.dart';

// Firebase imports commented out temporarily
// import 'package:firebase_core/firebase_core.dart';
// import 'core/config/firebase_config.dart';
// import 'core/config/hive_config.dart';
// import 'injection/injection_container.dart';

Future<void> main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set up global error handling for Flutter framework errors
  FlutterError.onError = (FlutterErrorDetails details) {
    // Log the error details
    debugPrint('Flutter Error: ${details.exception}');
    debugPrint('Stack trace: ${details.stack}');
    
    // In debug mode, present the error normally
    if (kDebugMode) {
      FlutterError.presentError(details);
    }
  };
  
  // Set up custom error widget to handle assertion errors gracefully
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return Material(
      child: Container(
        color: Colors.red[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 16),
            const Text(
              'حدث خطأ في التطبيق',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'يرجى إعادة تشغيل التطبيق',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            if (kDebugMode) ...[
              const SizedBox(height: 16),
              Text(
                'Debug Info: ${errorDetails.exception.toString()}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  };
  
  try {
    // Load environment variables with better error handling
    await dotenv.load(fileName: ".env").catchError((error) {
      debugPrint('No .env file found: $error');
      // Continue without .env file - app can still run
      return <String, String>{};
    });
    
    // Initialize Hive for local storage with error handling
    try {
      await Hive.initFlutter();
      debugPrint('Hive initialized successfully');
      // await HiveConfig.init(); // Uncomment when HiveConfig is implemented
    } catch (e) {
      debugPrint('Hive initialization failed: $e');
      // Continue without Hive - app can still run
    }
    
    // Firebase temporarily disabled until properly configured
    // TODO: Enable Firebase when ready with proper configuration
    // await Firebase.initializeApp(
    //   options: FirebaseConfig.currentPlatform,
    // );
    debugPrint('Firebase initialization skipped (temporarily disabled)');
    
    // Initialize dependency injection with error handling
    // try {
    //   await InjectionContainer.init();
    //   debugPrint('Dependency injection initialized successfully');
    // } catch (e) {
    //   debugPrint('Dependency injection initialization failed: $e');
    //   // Continue without DI - app can still run with basic functionality
    // }
    
    debugPrint('App initialization completed successfully');
    
  } catch (e, stackTrace) {
    debugPrint('Critical initialization error: $e');
    debugPrint('Stack trace: $stackTrace');
    // Continue running the app even if some initialization fails
  }
  
  // Run the app with proper error boundary
  runApp(
    const ProviderScope(
      child: BalacifyApp(),
    ),
  );
}