import 'package:flutter/material.dart';
import 'package:haozuke_test/pages/first_page/index.dart';
import 'package:haozuke_test/pages/getx_text/test1.dart';
import 'package:haozuke_test/pages/home/tab_index/tab_index.dart';
import 'package:haozuke_test/widgets/page_content.dart';

class TabItem {
  String? title;
  Icon? icon;

  TabItem({
    Key? key,
    this.title,
    this.icon,
  });
}

List<TabItem> tabItems = [
  TabItem(title: '首页',icon: const Icon(Icons.home)),
  TabItem(title: '搜索',icon: const Icon(Icons.search)),
  TabItem(title: '资讯',icon: const Icon(Icons.info)),
  TabItem(title: '我的',icon: const Icon(Icons.account_circle)),
];


class HomePage extends StatefulWidget {

  const HomePage({
    super.key
  });

  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  late List<Widget> tabViewList;

  List<BottomNavigationBarItem> barItemList = tabItems.map((e) {
    return BottomNavigationBarItem(icon: e.icon ?? const Icon(Icons.width_normal),label: e.title);
  }).toList();

  void onItemTaped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {

    tabViewList = tabItems.asMap().keys.map((i) {
      if (i == 0) {
        return const TabIndex();
      } else if (i == 1) {
        return const FirstPage();
      } else if (i == 2) {
        return const TestPage();
      }
      return PageContent(name: tabItems[i].title,);
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: tabViewList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: onItemTaped,
      ),

    );

    // return const PageContent(name: "首页");
  }
}
