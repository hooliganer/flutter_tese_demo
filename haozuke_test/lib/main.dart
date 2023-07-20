import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:haozuke_test/application.dart';

void main() async {
  await GetStorage.init();
  runApp(const Application());
}
