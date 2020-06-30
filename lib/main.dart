import 'package:flutter/material.dart';
import 'package:webtodo/extensions.dart';
import 'package:webtodo/new_todo_page.dart';
import 'package:webtodo/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todoList = [];

  void _openNewTodoPage() async {
    Todo newTodo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewTodoPage(),
      ),
    );
    if (newTodo != null) {
      setState(() {
        this.todoList.add(newTodo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, int index) {
          Todo todo = todoList[index];
          return ListTile(
            title: Text(todo.name),
            subtitle: todo.description != null ? Text(todo.description) : null,
            trailing: Text(todo.createdOn.prettyDateTime()),
            dense: true,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewTodoPage,
        tooltip: 'New Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
