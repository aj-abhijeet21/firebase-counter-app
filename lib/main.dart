import 'package:counter_firebase/screens/counter_1.dart';
import 'package:counter_firebase/screens/counter_2.dart';
import 'package:counter_firebase/screens/counter_3.dart';
import 'package:counter_firebase/services/firestore_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => FirestoreProvider(),
      child: const MyApp(),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFCC004A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFCC004A),
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF171717),
          elevation: 10,
          selectedItemColor: Color(0xFFCC004A),
          unselectedItemColor: Color(0xFF434242),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFCC004A),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  static const List<Widget> _pages = [
    Counter1(),
    Counter2(),
    Counter3(),
  ];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final bottomNavBarList = const [
    BottomNavigationBarItem(
      label: 'Counter 1',
      icon: Icon(
        Icons.looks_one,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Counter 2',
      icon: Icon(
        Icons.looks_two,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Counter 3',
      icon: Icon(
        Icons.looks_3,
      ),
    ),
  ];

  @override
  void initState() {
    Provider.of<FirestoreProvider>(context, listen: false).getCounters();
    super.initState();
    // initFirebase();
  }

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Home._pages.elementAt(
          _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarList,
        onTap: _onTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
