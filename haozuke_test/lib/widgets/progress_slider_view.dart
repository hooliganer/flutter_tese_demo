import 'package:flutter/material.dart';
import 'package:haozuke_test/others/macro_file.dart';


class ProgressSliderView extends StatefulWidget {

  final double percentValue;
  double get percent => percentValue;

  bool get isFull => percent >= 1;

  const ProgressSliderView({super.key, required this.percentValue});

  @override
  State<ProgressSliderView> createState() => _ProgressSliderViewState();
}

class _ProgressSliderViewState extends State<ProgressSliderView> {

  @override
  Widget build(BuildContext context) {

    double totalWidth = 247;
    double height = 33;

    Widget curPrgView = Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: totalWidth * widget.percent,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xff6bdddd),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    Widget noEnoughText = const Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Text(
          'NO ENOUGH',
          style: TextStyle(
            color: Color(0x473D3D3D),
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
        ),
      ),
    );

    List<Widget> arr = [curPrgView];
    if (!widget.isFull) {
      arr.add(noEnoughText);
    }

    return Stack(

      children: [

        Padding(
          padding: const EdgeInsets.only(top: 9,bottom: 3),
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            // color: Colors.lightGreen,
            width: totalWidth,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: arr,
            ),
          ),
        ),

        Positioned(
          left: totalWidth * widget.percent - 11.5,
          child: Image.asset('static/images/bottle.png'),
        ),
      ],
    );
  }
}
