import 'package:flutter/material.dart';
import 'package:todo_app/modal/item.dart';
import 'package:todo_app/widget/card_body_widget.dart';
import 'package:todo_app/widget/card_modal_bottom_widget.dart';

void main(List<String> args) {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItem> items = [DataItem(id: "1", name: "Thức Dậy")];

  void _handleAddTask(String name) {
    final newItem = DataItem(id: DateTime.now().toString(), name: name);
    items.add(newItem);
    // update state
    setState(() {
      items;
    });
  }

  void _handleDelete(String id) {
    // remove item by id
    items.removeWhere((item) => item.id == id);
    // update state
    setState(() {
      items;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children:
              items
                  .map(
                    (item) => CardBody(
                      index: items.indexOf(item),
                      item: item,
                      onDelete: _handleDelete,
                    ),
                  )
                  .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: show modal bottom sheet
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext content) {
              return ModalBottom(onAddTask: _handleAddTask);
            },
          );
        },
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        tooltip: 'Add Todo',
        child: const Icon(Icons.add, color: Colors.white, size: 40),
      ),
    );
  }
}
