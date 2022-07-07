import 'package:flutter/material.dart';
import 'package:todo_list/model/item.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> itemList = <Item>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            height: 45,
            child: Text('${itemList[index].title}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const item = EnterTitleItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EnterTitleItem extends StatelessWidget {
  const EnterTitleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('test')
    );
  }
}
