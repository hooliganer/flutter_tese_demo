import 'package:flutter/material.dart';
import 'package:haozuke_test/widgets/add_new_bottle_btn.dart';
import 'package:haozuke_test/widgets/progress_slider_view.dart';

class ProgressView extends StatefulWidget {

  final int totalValue;
  final int curValue;

  int get total => totalValue;
  int get current => curValue;

  double get percent => curValue/total;

  const ProgressView({
    super.key,
    required this.curValue,
    required this.totalValue
  });

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(216, 216, 216, 0.66),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Today Vitamin supplementation',),
                  SizedBox(
                    width: 247,
                    height: 60,
                    child: ProgressSliderView(percentValue: widget.percent,),
                  ),
                ],
              ),

              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffD8D8D8),
                ),
                clipBehavior: Clip.hardEdge,
                child: const AddNewBottleBtn(),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
