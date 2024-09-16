import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mellow_auth/screens/HomeScreen/home_screen.dart';
import 'package:mellow_auth/screens/Onboarding/onboaring_screen.dart';
import 'package:mellow_auth/screens/SignIn/sign_in_screen.dart';
import 'package:mellow_auth/screens/SignUp/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MellowApp());
}

class MellowApp extends StatelessWidget {
  const MellowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.grey),
        ),
      ),
      // Define the routes for sign-in, sign-up, and home
      routes: {
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => const HomeScreen(),
      },
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isOnboardingCompleted = false;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _checkOnboardingAndAuth();
  }

  Future<void> _checkOnboardingAndAuth() async {
    // Check if onboarding is completed
    final prefs = await SharedPreferences.getInstance();
    bool? onboardingCompleted = prefs.getBool('onboardingCompleted');
    _isOnboardingCompleted = onboardingCompleted ?? false;

    // Check if the user is signed in (Firebase Auth)
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      _currentUser = auth.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Navigate to onboarding if not completed, else check sign-in status
    if (!_isOnboardingCompleted) {
      return OnboardingPage();
    } else if (_currentUser == null) {
      return SignInPage();
    } else {
      return const HomeScreen();
    }
  }
}
