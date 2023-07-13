import 'package:flutter/material.dart';
import 'package:haozuke_test/routes.dart';

class PageContent extends StatelessWidget {

  final String? name;

  const PageContent({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("当前：$name"),
      ),
      body: ListView(
        children: [
          TextButton(onPressed: () {
            Navigator.pushNamed(context, Routes.home);
          }, child: Text(Routes.home)),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, Routes.login);
          }, child: Text(Routes.login)),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/gf343sd");
          }, child: const Text("不存在的页面")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/room/222");
          }, child: const Text("房屋详情页，id:222")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, Routes.table);
          }, child: Text(Routes.table)),
        ],
      ),
    );
  }
}
