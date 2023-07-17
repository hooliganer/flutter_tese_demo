import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haozuke_test/pages/first_page/widgest/first_page_cell.dart';
import 'package:haozuke_test/widgets/progress_view.dart';

class FirstController extends GetxController {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    update();
  }
}

class FirstPage extends StatelessWidget {

  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<FirstController>(
        init: FirstController(),
        builder: (controller) {

          return Scaffold(

            appBar: AppBar(title: const Text('Simple')),

            body: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ProgressView(curValue: 1,totalValue: 3,),
                    ),
                    SizedBox(
                      height: 500,
                      child: FirstPageCollectionView(),
                    ),
                  ],
                ),
              ),
            ),

          );
        });
  }
}