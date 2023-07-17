import 'package:flutter/material.dart';

class AddNewBottleBtn extends StatefulWidget {
  const AddNewBottleBtn({super.key});

  @override
  State<AddNewBottleBtn> createState() => _AddNewBottleBtnState();
}

class _AddNewBottleBtnState extends State<AddNewBottleBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("static/images/bottle_small.png"),
          Image.asset("static/images/add-fill.png"),
        ],
      ),
    );
  }
}
