import 'package:flutter/material.dart';

class RoomDetail extends StatelessWidget {

  final String roomId;

  const RoomDetail({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("roomid:$roomId"),),
    );
  }
}
