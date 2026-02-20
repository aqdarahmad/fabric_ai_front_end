import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard.dart';
import 'screens/result_page.dart';
import 'screens/fabric_view_page.dart';
import 'screens/create_profile.dart';
import 'screens/settings_page.dart';
import 'home.dart';
//import 'test_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fabric Inspection App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
 
     initialRoute: '/login',
      
     
      routes: {
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
        '/dashboard': (context) => const FabricDashboard(),
        '/results': (context) => const ResultPage(),
        '/view': (context) => const FabricViewPage(),
        '/profile': (context) => const CreateProfileScreen(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

/* import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const FabricAIApp());
}

class FabricAIApp extends StatelessWidget {
  const FabricAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fabric AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
           elevation: 2,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
} */