import 'package:flutter/material.dart';

class IndexNavigatorItem {
  final String title;
  final String imageUrl;
  final Function(BuildContext context) onTap;

  IndexNavigatorItem(this.title,this.imageUrl,this.onTap);

}

List<IndexNavigatorItem> navigatorItemList = [
  IndexNavigatorItem('整租', 'static/images/home.png', (context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('合租', 'static/images/person.png', (context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('地图找房', 'static/images/loc.png', (context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('出租', 'static/images/home-sharp.png', (context) {
    Navigator.of(context).pushNamed('login');
  }),
];