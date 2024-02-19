import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final VoidCallback onToDoChanged;
  final Function(String?) onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: onToDoChanged,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: cBlue,
        ),
        title: Text(
          todo.todoText ?? '',
          style: TextStyle(
            fontSize: 16,
            color: cBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: todo.isDone ? Colors.green : Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                todo.isDone ? 'Completed' : 'Pending',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: cBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                color: Colors.white,
                iconSize: 18,
                icon: const Icon(Icons.delete),
                onPressed: () => onDeleteItem(todo.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
