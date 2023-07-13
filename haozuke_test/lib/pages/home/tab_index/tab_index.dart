import 'package:flutter/material.dart';
import 'package:haozuke_test/pages/home/tab_index/index_navigation.dart';
import 'package:haozuke_test/widgets/opacity_banner.dart';
import 'package:haozuke_test/widgets/slide_banner.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("data"),),

      body: ListView(
        children: const [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: OpacityBanner(),
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: SlideBanner(),
          ),
          IndexNavigator(),
        ],
      ),
    );
  }
}
