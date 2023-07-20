import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haozuke_test/pages/first_page/widgest/first_page_grid_view.dart';

class FirsPageCellModel {
  String? cover;
  String? content;
  String? name;
  String? avatar;

  late bool isLiked;

  late int id;

  FirsPageCellModel({
    required this.id,
    String? cover,
    String? content,
    String? name,
    String? avatar,
    bool isLiked = false,
  });
}

class FirstPageCellLogic extends GetxController {
  bool _isLike = false;

  bool get isLike => _isLike;

  FirsPageCellModel dataModel;

  FirstPageCellLogic({
    required this.dataModel,
  });

  @override
  void onInit() {
    super.onInit();
    _isLike = dataModel.isLiked;
  }

  void likeAction() {
    _isLike = !_isLike;
    update();
    Get.find<FirstPageGridViewLogic>().dataModels[dataModel.id].isLiked = _isLike;
  }
}

class FirstPageCell extends StatelessWidget {
  FirsPageCellModel dataModel;

  FirstPageCell({
    super.key,
    required this.dataModel,
  });

  void likeAction() {
    dataModel.isLiked = !dataModel.isLiked;
  }

  @override
  Widget build(BuildContext context) {
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
            child: Image.network(
              dataModel.cover ?? "",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataModel.content ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 17,
                                height: 17,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.5),
                                ),
                                child: Image.network(
                                  dataModel.avatar ?? "",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  dataModel.name ?? "",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      child: GetBuilder<FirstPageCellLogic>(
                        init: FirstPageCellLogic(dataModel: dataModel),
                        // id: dataModel.id,
                        global: false,
                        builder: (logic) {
                          return TextButton(
                            onPressed: () {
                              // logic._isLike = !logic._isLike;
                              // logic.update();
                              // dataModel.isLiked = logic.isLike;
                              logic.likeAction();
                            },
                            child: Image.asset(
                              logic.isLike ? 'static/images/like_red.png' : 'static/images/like_gray.png',
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
