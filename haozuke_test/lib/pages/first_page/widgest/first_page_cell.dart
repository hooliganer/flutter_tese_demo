import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FirsPageCellModel {

  String? cover;//https://upload-images.jianshu.io/upload_images/127924-dec37275411437de.jpg
  String? content;
  String? name;
  String? avatar;// https://profile-avatar.csdnimg.cn/5ee90a5353134cca9b830939e49e793b_u013937668.jpg!1
  
}

class FirstPageCellControlller extends GetxController {

  // var dataModel = FirsPageCellModel().obs;

  void test() {

  }

}

class FirstPageCell extends StatelessWidget {

  // final aControlller = Get.put(FirstPageCellControlller());

  FirsPageCellModel dataModel;

  FirstPageCell({super.key,required this.dataModel});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: FirstPageCellControlller(),
      builder: (controller) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [

              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Obx(() => Image.network(
                  dataModel.cover ?? "",
                  fit: BoxFit.cover,
                ),)
              ),

              Positioned(
                bottom: 0,
                height: 59,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0x7d000000),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                              dataModel.content ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                            ),),
                            const Divider(height: 6,),
                            Row(
                              children: [
                                SizedBox(
                                  width: 17,
                                  height: 17,
                                  child: Obx(() => Image.network(
                                    dataModel.avatar ?? "",
                                  )),
                                ),
                                const Divider(thickness: 4,),
                                Obx(() => Text(
                                  dataModel.name ?? "",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );


  }
}


class FirstCellController extends GetxController {

  var dataModels = List<FirsPageCellModel>.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void loadData() {
    dataModels.value = [
      FirsPageCellModel();
    ];
    update();
  }

}

class FirstPageCollectionView extends StatelessWidget {

  const FirstPageCollectionView({super.key});



  @override
  Widget build(BuildContext context) {

    double itemWidth = (MediaQuery.of(context).size.width - 42)/2;
    
    return GetBuilder<FirstCellController>(
        init: FirstCellController(),
        builder: (controller) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 167 / 207,
            ),
            itemBuilder: (ctx, index) {
              return FirstPageCell(dataModel: controller.dataModels[index],);
            },
            itemCount: 9,
          );
        });
  }
}
