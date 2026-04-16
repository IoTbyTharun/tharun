import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Record App',
      home: StudentScreen(),
    );
  }
}

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<String> students = [];
  TextEditingController controller = TextEditingController();

  void addStudent() {
    if (controller.text.isNotEmpty) {
      setState(() {
        students.add(controller.text);
        controller.clear();
      });
    }
  }

  void removeStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Records"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Enter Student Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: addStudent,
            child: Text("Add Student"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => removeStudent(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}