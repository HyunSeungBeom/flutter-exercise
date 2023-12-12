import 'package:flutter/material.dart';
import 'dart:collection';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class Student {
  Student({required this.name, required this.age});

  final String name;
  int age;
}

// 1
class PlayerNotifier with ChangeNotifier {
  final List<Student> _players = <Student>[];
  int _size = 0;

  List<Student> getPlayers() => UnmodifiableListView(_players);
  int getSize() => _size;

  // 2
  void add(Student student) {
    _players.add(student);
    _size++;
    notifyListeners();
  }

  void delete(int index) {
    _players.removeAt(index);
    _size--;
    notifyListeners();
  }

  void modify(int index, Student student) {
    _players[index] = student;
    notifyListeners();
  }
}

AppBar getAppBar(String title) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    title: Text(title),
  );
}

ListTile getListTile(List<Student> players, int index) {
  return ListTile(
    leading: CircleAvatar(child: Text(index.toString())),
    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
    title: Text('${players[index].name}, age : ${players[index].age}'),
  );
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ListenChangeNotifier());
  }
}

class ListenChangeNotifier extends StatefulWidget {
  const ListenChangeNotifier({Key? key}) : super(key: key);

  @override
  State<ListenChangeNotifier> createState() => _ListenChangeNotifierState();
}

// 3
PlayerNotifier playerNotifier = PlayerNotifier();

class _ListenChangeNotifierState extends State<ListenChangeNotifier> {
  @override
  void initState() {
    super.initState();
    // 4
    playerNotifier.addListener(() => mounted ? setState(() {}) : null);
  }

  @override
  void dispose() {
    // 5
    playerNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: getAppBar('Default Change Notifier Example'),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddPage()),
          ),
          child: const Icon(Icons.add),
        ),
        body: _getListView(),
      ),
    );
  }

  ListView _getListView() {
    return ListView.builder(
      // 6
      itemCount: playerNotifier.getSize(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ModifyPage(index: index)),
          ),
          // 7
          child: getListTile(playerNotifier.getPlayers(), index),
        );
      },
    );
  }
}

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController =
        TextEditingController(text: "Name");
    TextEditingController ageEditingController =
        TextEditingController(text: "Age");

    return Scaffold(
      appBar: getAppBar("Add Student"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Student stu = Student(
            name: textEditingController.text,
            age: int.parse(ageEditingController.text),
          );
          // 8
          playerNotifier.add(stu);
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(children: [
            TextField(
              controller: textEditingController,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ageEditingController,
            ),
          ]),
        ),
      ),
    );
  }
}

class ModifyPage extends StatelessWidget {
  const ModifyPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    // 9
    TextEditingController textEditingController =
        TextEditingController(text: playerNotifier.getPlayers()[index].name);
    TextEditingController ageEditingController = TextEditingController(
        text: playerNotifier.getPlayers()[index].age.toString());

    return Scaffold(
      appBar: getAppBar("Update Player"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Student stu = Student(
            name: textEditingController.text,
            age: int.parse(ageEditingController.text),
          );
          // 10
          playerNotifier.modify(index, stu);
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(children: [
            TextField(
              controller: textEditingController,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ageEditingController,
            ),
          ]),
        ),
      ),
    );
  }
}
