import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/controller/todo_controller.dart';
import 'package:to_do_app/widgets/todo_item.dart';

class Home extends StatelessWidget {
  final ToDoController toDoController = Get.put(ToDoController());
  final TextEditingController _todoController = TextEditingController();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBGColor,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    'To-Do App',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: toDoController.todos.length,
                      itemBuilder: (context, index) {
                        var todo = toDoController.todos[index];
                        return ToDoItem(
                          todo: todo,
                          onToDoChanged: () => toDoController.toggleToDoStatus(todo),
                          onDeleteItem: (id) => toDoController.deleteToDoItem(id!),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: 'New Task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
                    ),
                    onPressed: () {
                      toDoController.addToDoItem(_todoController.text);
                      _todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: cBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
