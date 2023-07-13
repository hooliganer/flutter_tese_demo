import 'package:flutter/material.dart';
import 'package:haozuke_test/pages/home/tab_index/index_navigator_item.dart';


class IndexNavigator extends StatelessWidget {

  const IndexNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navigatorItemList.map((item) {
          return InkWell(
            onTap: () {
              item.onTap(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(item.imageUrl,fit: BoxFit.contain,),
                Text(item.title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
