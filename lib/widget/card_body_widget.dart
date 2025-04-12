import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modal/item.dart';

class CardBody extends StatelessWidget {
  final DataItem item;
  final Function(String) onDelete;

  const CardBody({super.key, required this.item, required this.onDelete});

  void _handleDelete(BuildContext context, String id) async {
    if (await confirm(context)) {
      // delete item
      onDelete(id);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xffDFDFDF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff4B4B4B),
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () => _handleDelete(context, item.id),
              child: const Icon(Icons.delete, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
