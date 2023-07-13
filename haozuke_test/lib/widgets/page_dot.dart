import 'package:flutter/material.dart';

class PageDot extends StatefulWidget {

  final int num;

  final int currentIndex;

  const PageDot({super.key,required this.num,required this.currentIndex});

  @override
  State<PageDot> createState() => _PageDotState();
}

class _PageDotState extends State<PageDot> {

  @override
  Widget build(BuildContext context) {

    List<int> arr = [];
    for (int i = 0;i<widget.num;i++) {
      arr.add(i);
    }

    return Positioned(
      bottom: 20,
      child: Row(
        children: arr.asMap().keys.map((idx) {
          return Container(
            clipBehavior: Clip.hardEdge,
            width: idx == widget.currentIndex ? 10 : 5,
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: idx == widget.currentIndex ? Colors.red : Colors.grey,
              borderRadius: BorderRadius.circular(2.5),
            ),
          );
        }).toList(),
      ),
    );

  }
}
