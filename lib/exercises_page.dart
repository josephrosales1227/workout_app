import 'package:flutter/material.dart';
import 'package:searchable_listview/resources/arrays.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'exercise_class.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  List<Exercise> exercises = [
    Exercise("Squat", "Bend your legs.", "Legs"),
    Exercise("Bench", "Bend your legs.", "Legs"),
    Exercise("Deadlift", "Bend your legs.", "Legs"),
  ];

  @override
  Widget build(BuildContext context) {
    // Sort list of exercises alphabetically
    exercises.sort();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                height: 100
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                  icon: Icon(Icons.filter_alt_rounded),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: Text('Filter'),
                      ),
                    );
                  }
              ),
            ),
            Flexible(
              flex: 9,
              child: Container(
                height: 400,
                width: 600,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: SearchableList<Exercise>(
                  // Keyboard doesn't pop up automatically when going to exercise page
                  spaceBetweenSearchAndList: 0,
                  autoFocusOnSearch: false,
                  initialList: exercises,
                  builder: (Exercise exercise) => TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                            title: Text(exercise.name),
                            children: [
                              Text(exercise.description),
                            ]
                        ),
                      );
                    },
                    child: Text(exercise.name),
                  ),
                  filter: (value) => exercises.where((element) => element.name.toLowerCase().contains(value),).toList(),
                  inputDecoration: InputDecoration(
                    labelText: "Search",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            )
        ]
      ),
    );
  }
}
