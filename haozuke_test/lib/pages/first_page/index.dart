
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haozuke_test/pages/first_page/widgest/first_page_grid_view.dart';
import 'package:haozuke_test/widgets/progress_view.dart';

class FirstController extends GetxController {

  void gettt() {
    // var d = GetStorage();
  }

}

class FirstPage extends StatelessWidget {

  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstController>(
        init: FirstController(),
        builder: (controller) {
          return LayoutBuilder(builder: (ctx, constraints) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ProgressView(
                            curValue: 1,
                            totalValue: 3,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: FirstPageGridView(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
