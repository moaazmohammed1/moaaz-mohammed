import 'package:flutter/material.dart';
import 'package:note3/sql_helper.dart';

import 'home_screen.dart';

// import 'package:note_app/shared/cubit/cubit.dart';

class NewNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Notes',
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 235, 235, 235),
                border: Border(
                  left: BorderSide(width: 7.0, color: Colors.blue),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${SQLHelper.tasks[index]['title']}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${SQLHelper.tasks[index]['description']}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: SQLHelper.tasks.length,
          ),
        ));
  }
}
