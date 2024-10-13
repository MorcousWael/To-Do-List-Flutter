import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily",
      theme: ThemeData(primaryColor: Colors.blue, useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "My Daily Tasks",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Column(
        children: [Progress(), TaskList()],
      ),
    );
  }
}

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  double? _progressVal = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: Text("Keep Going")),
        LinearProgressIndicator(
          value: _progressVal,
        )
      ],
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TaskItem(label: "Pray Morning"),
        TaskItem(label: "Flutter"),
        TaskItem(label: "Go Out"),
        TaskItem(label: "Bible"),
        TaskItem(label: "Pray Night"),
      ],
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;
  const TaskItem({super.key, required this.label});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checked,
            onChanged: (bool? newVal) {
              setState(() {
                checked = newVal!;
                if (checked == true) {
                  _ProgressState()._progressVal = 0.2;
                }
              });
            }),
        Text(widget.label)
      ],
    );
  }
}
