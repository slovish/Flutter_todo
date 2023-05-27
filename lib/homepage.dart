import 'package:flutter/material.dart';
import 'package:todo/controller/todo_list_controller.dart';
import 'package:todo/todo_card.dart';
import 'package:get/get.dart';

import 'deleted.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  listController controller1 = Get.put(listController());
  TextEditingController inputController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Add TODO"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(deleted_todo());
              },
              icon: Icon(
                Icons.delete,
                color: Colors.grey[400],
                size: 30,
              ))
        ],
      ),
      body: Container(
        child: Stack(children: [
          GetBuilder<listController>(
            builder: (_) {
              return ListView.builder(
                  itemCount: controller1.TodoList.length,
                  itemBuilder: (context, index) {
                    return todo_card(
                      text: controller1.TodoList[index],
                      index: index,
                      del: true,
                    );
                  });
            },
          ),
          Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 14, 60, 97),
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width - 70,
                      child: TextFormField(
                        controller: inputController,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          controller1.add_to_list(inputController.text);
                          inputController.clear();
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.grey[400],
                          size: 40,
                        ))
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
