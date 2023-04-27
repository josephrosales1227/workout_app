import 'package:flutter/material.dart';
import 'social_page.dart';
import 'stats_page.dart';
import 'exercises_page.dart';
import 'food_diary_page.dart';
import 'workout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 2;
  final pages = [
    FoodDiaryPage(),
    ExercisesPage(),
    WorkoutPage(),
    StatsPage(),
    SocialPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_rounded),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_martial_arts_rounded),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart_rounded),
              label: 'Stats'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_rounded),
              label: 'Social'
          ),
        ],
      ),
    );
  }
}
