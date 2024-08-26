import 'package:flutter/material.dart';
import '../screen/form.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  Map<String, Map<String, String>> studentData = {
    "1": {"name": "Amit", "roll": "1"},
    "2": {"name": "Rahul", "roll": "2"},
    "3": {"name": "Rohit", "roll": "3"},
    "4": {"name": "Raj", "roll": "4"},
    "5": {"name": "Ravi", "roll": "5"},
  };

  void addStudent(String name, String roll) {
    setState(() {
      studentData[(studentData.length + 1).toString()] = {
        "name": name,
        "roll": roll,
      };
    });
  }

  void deleteData(String id) {
    setState(() {
      studentData.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: ListView(
        children: studentData.entries.map((e) {
          final id = e.key;
          final info = e.value;

          return Card(
            child: ListTile(
              title: Text(info["name"] ?? "null"),
              subtitle: Text(info['roll'] ?? "null"),
              trailing: Wrap(
                spacing: 8.0,
                children: [
                  IconButton(
                    onPressed: () async {
                      final updatedStudent = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentForm(
                            id: id,
                            name: info['name'],
                            roll: info['roll'],
                          ),
                        ),
                      );

                      if (updatedStudent != null) {
                        setState(() {
                          studentData[updatedStudent['id']] = {
                            'name': updatedStudent['name'],
                            'roll': updatedStudent['roll'],
                          };
                        });
                      }
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteData(id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Example of how you might add a new student
          addStudent('New Student', '6');
        },
      ),
    );
  }
}
