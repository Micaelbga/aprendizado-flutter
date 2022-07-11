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
  var isEdit = false;
  var itemIndex;
  late FocusNode myFocusNode;

  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void save() {
    setState(() {
      if (inputText.text == "") return;
      if (isEdit == true) {
        itemList[itemIndex].title = inputText.text;
        inputText.text = "";
        isEdit = false;
        FocusManager.instance.primaryFocus?.unfocus();
        return;
      }
      itemList.add(Item(inputText.text));
      inputText.text = "";
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de tarefas"),
        ),
        body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(5),
              height: 45,
              child: Row(
                children: [
                  Text('${itemList[index].title}'),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        isEdit = true;
                        itemIndex = index;
                        myFocusNode.requestFocus();
                      });
                    },
                  ),
                  IconButton(
                      icon: itemList[index].check
                          ? Icon(Icons.check_box_rounded, color: Colors.green)
                          : Icon(Icons.check_box_outline_blank_outlined),
                      onPressed: () {
                        setState(() {
                          itemList[index].check = !itemList[index].check;
                        });
                      })
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: MediaQuery.of(context).viewInsets,
          color: Colors.grey[400],
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  focusNode: myFocusNode,
                  controller: inputText,
                  decoration: InputDecoration(hintText: 'Nova Tarefa...'),
                ),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.add), onPressed: save),
            ],
          ),
        ));
  }
}
