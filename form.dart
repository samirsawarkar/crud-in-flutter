import 'package:flutter/material.dart';

class StudentForm extends StatefulWidget {
  final String id;
  final String? name;
  final String? roll;

  const StudentForm({required this.id, this.name, this.roll});

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  late TextEditingController _nameController;
  late TextEditingController _rollController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name ?? "");
    _rollController = TextEditingController(text: widget.roll ?? "");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _rollController,
              decoration: InputDecoration(labelText: 'Roll'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Pass the updated data back to the previous screen
                Navigator.pop(context, {
                  'id': widget.id,
                  'name': _nameController.text,
                  'roll': _rollController.text,
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
