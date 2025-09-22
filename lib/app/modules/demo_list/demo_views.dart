import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'demo_controller.dart';
// import 'todo_controller.dart';

class TodoPage extends StatelessWidget {
  final TodoController controller = Get.find<TodoController>();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Todo List")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "Enter todo",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    controller.addTodo(textController.text);
                    textController.clear();
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ),
          TextButton(onPressed: (){
            Get.back();
          }, child: Text("back")),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (context, index) {
                var list = controller.todos[index];
                return ListTile(
                  title: Text('${list}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.removeTodo(index),
                  ),
                );
              },
            )),
          ),

        ],
      ),
    );
  }
}
