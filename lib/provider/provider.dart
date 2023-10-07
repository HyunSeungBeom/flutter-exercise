import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Todo {
  final String title;
  bool isDone;

  Todo(this.title, this.isDone);
}

class TodoListProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Todo(title, false));
    notifyListeners(); 
  }

  void toggleTodoStatus(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoListProvider(),
      child: const MaterialApp(
        home: TodoApp(),
      ),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController _controller = TextEditingController();
              return AlertDialog(
                title: const Text('Add To-Do'),
                content: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: 'Enter a task'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final String newTodo = _controller.text;
                      if (newTodo.isNotEmpty) {
                        context.read<TodoListProvider>().addTodo(newTodo);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoListProvider>().todos;

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          trailing: Checkbox(
            value: todo.isDone,
            onChanged: (bool? value) {
              context.read<TodoListProvider>().toggleTodoStatus(index);
            },
          ),
        );
      },
    );
  }
}
