import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haozuke_test/pages/first_page/widgest/first_page_cell.dart';

class FirstPageGridViewLogic extends GetxController {

  var dataModels = List<FirsPageCellModel>.empty().obs;

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  void loadData() {

    FirsPageCellModel amodel(int id) {
      FirsPageCellModel amodel = FirsPageCellModel(id: id);
      amodel.cover = "https://upload-images.jianshu.io/upload_images/127924-dec37275411437de.jpg";
      amodel.avatar = "https://profile-avatar.csdnimg.cn/5ee90a5353134cca9b830939e49e793b_u013937668.jpg!1";
      amodel.content = "神鼎飞大法师大法师代发神鼎飞大法师大法师代发神鼎飞大法师大法师代发";
      amodel.name = "$id - 名称";
      amodel.isLiked = false;
      return amodel;
    }

    for (int i=0;i<25;i++) {
      dataModels.add(amodel(i));
    }

  }
}

class FirstPageGridView extends StatelessWidget {

  const FirstPageGridView({super.key});

  @override
  Widget build(BuildContext context) {

    double itemWidth = (MediaQuery.of(context).size.width - 42)/2;

    FirstPageGridViewLogic putLogic = Get.put(FirstPageGridViewLogic());

    return GetBuilder<FirstPageGridViewLogic>(
        init: FirstPageGridViewLogic(),
        assignId: true,
        builder: (controller) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 167 / 207,
            ),
            itemBuilder: (ctx, index) {
              print("设置 Cell 了！！$index ${controller.dataModels.value[index].isLiked}");
              return Obx(() {
                return FirstPageCell(dataModel: controller.dataModels.value[index],);
              });
              return FirstPageCell(dataModel: controller.dataModels[index],);
            },
            itemCount: controller.dataModels.length,
          );
        });
  }
}