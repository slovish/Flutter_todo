import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/todo_card.dart';

import 'controller/todo_list_controller.dart';

class deleted_todo extends StatelessWidget {
  deleted_todo({super.key});

  final listController _controller1 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Deleted Todos'),
      ),
      body: Container(
        child: GetBuilder<listController>(
          builder: (_) {
            return ListView.builder(
                itemCount: _controller1.DeletedList.length,
                itemBuilder: (context, index) {
                  return todo_card(
                    text: _controller1.DeletedList[index],
                    index: index,
                    del: false,
                  );
                });
          },
        ),
      ),
    );
  }
}
