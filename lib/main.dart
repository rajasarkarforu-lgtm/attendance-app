import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class Student {
  String name;
  bool present;
  int fees;

  Student(this.name, {this.present = false, this.fees = 0});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> students =
      List.generate(20, (index) => Student("Student ${index + 1}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance + Fees"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(students[index].name),
              leading: Checkbox(
                value: students[index].present,
                onChanged: (val) {
                  setState(() {
                    students[index].present = val!;
                  });
                },
              ),
              trailing: SizedBox(
                width: 80,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Fees",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) {
                    students[index].fees = int.tryParse(val) ?? 0;
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
