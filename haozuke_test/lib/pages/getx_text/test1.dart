import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestLogic extends GetxController {
  // GetBuilder 方式
  int _counter = 0;

  int get counter => _counter;

  // OBX方式
  var obxCounter = 0.obs;

  void increment() {
    _counter++;
    obxCounter.value++;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    print("test init");
  }

  @override
  void onReady() {
    super.onReady();
    print("test ready!!");
  }

  @override
  void onClose() {
    super.onClose();
    print("test Close ~~~~~");
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final aLogic = Get.put(TestLogic());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text("Get builder消耗的资源更少，性能更好，当只需要更新一小部分时，用它",style: TextStyle(color: Colors.green),),
            GetBuilder<TestLogic>(
              init: TestLogic(),
              builder: (logic) {
                return Text('GetBuilder：${logic.counter.toString()}');
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text("Obx 当需要根据状态变化自动更新件时，用它",style: TextStyle(color: Colors.green)),
            Obx(
              () => Text('Obx：${Get.find<TestLogic>().obxCounter.value}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<TestLogic>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
