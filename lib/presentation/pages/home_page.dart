import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:what_to_do/presentation/_bindings/app_binding.dart';
import 'package:what_to_do/presentation/controllers/home_page_controller.dart';

import 'edit_page.dart';

class MyHomePage extends GetView<MyHomePageController> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) {
                      controller.id.value = int.parse(value!);
                    },
                    decoration: InputDecoration(label: Text("Enter Id")),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      controller.description.value = value!;
                    },
                    decoration:
                        InputDecoration(label: Text("Enter Description")),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          await controller.saveTodo();
                          await controller.getTodos();
                        }
                      },
                      child: Text('Save'))
                ],
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.todos.length,
                  itemBuilder: (context, index) {
                    final todo = controller.todos[index];
                    print(todo.isCompleted);
                    return ListTile(
                      leading: todo.isCompleted
                          ? Icon(Icons.check)
                          : Icon(Icons.close),
                      title: Text('${todo.description}'),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Get.to(() => MyEditPage(),
                              arguments: todo, binding: AppBinding());
                        },
                      ),
                      onLongPress: () async {
                        await controller.deleteTodo(todo.id);
                      },
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
