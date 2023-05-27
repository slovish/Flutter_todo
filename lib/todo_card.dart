// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'controller/todo_list_controller.dart';

class todo_card extends StatelessWidget {
  final String text;
  final int index;
  final bool del;
  todo_card({
    Key? key,
    required this.text,
    required this.index,
    required this.del,
  }) : super(key: key);

  final listController _controller1 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 14, 60, 97),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  text,
                  textScaleFactor: 2,
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
            ),
            del
                ? IconButton(
                    onPressed: () {
                      _controller1.delete_from_list(index);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey[400],
                      size: 30,
                    ))
                : Text("")
          ],
        ));
  }
}
