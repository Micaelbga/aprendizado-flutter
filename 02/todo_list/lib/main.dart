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
  final TextEditingController inputText = TextEditingController();
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
              borderRadius: BorderRadius.circular(10)
            ),
            height: 45,
            child: Row(
              children: [
                Text('${itemList[index].title}'),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      itemList[index].title = 'teste';
                      TextField(
                        controller: inputText,
                        focusNode: FocusNode(),
                      );
                    });
                  },
                ),
                IconButton(
                  icon: itemList[index].check ? Icon(Icons.check_box_rounded, color: Colors.green) : Icon(Icons.check_box_outline_blank_outlined),
                  onPressed: () {
                    setState(() {
                      itemList[index].check = !itemList[index].check;
                    });
                  }
                )
              ],
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            itemList.add(new Item('a'));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
