import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haozuke_test/pages/empty_page.dart';

void pushTo(Widget page,BuildContext context) {
  Navigator.push(context, CupertinoPageRoute(builder: (c) {
    return page;
  }));
}

class TablePage extends StatefulWidget {

  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {

  static const loadingTag = "LL-LOADING_TAG";

  final List<String> fake = [
    "a","b","c","a","b",
    "三大法师打发是的法师打发谁sadf23rq423r34r34r234r34r234r34r234r34r34",
    "c","a","b","ca","b",
    "c","a","b","ca","b",
    "c","a","b","ca","b",];
  List<String> array = [loadingTag];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void didSelectRow(int index) {
    pushTo(EmptyPage(title: array[index],), context);
  }

  void loadData() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        array.insertAll(
            array.length - 1,
            fake,
        );
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TablePage"),),
      body: ListView.separated(
        itemCount: array.length,
        itemBuilder: (ctx,index) {
          if (array[index] == loadingTag) {
            //最后一条处理
            if (array.length - 1 < 100) {
              //数据未达到100条  加载数据 显示loading
              loadData();
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
              );
            }
            //达到100条  显示没有更多
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text('没有更多了！',style: TextStyle(color: Colors.grey),),
            );
          }
          //其他情况 显示元素
          return Container(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity
              ),
              child: TextButton(
                style: const ButtonStyle(
                  // backgroundColor: MaterialStateColor.resolveWith((states) {
                  //   return Colors.grey;
                  // }),
                  // foregroundColor: MaterialStateColor.resolveWith((states) {
                  //   return Colors.white;
                  // }),
                ),
                onPressed: () {
                  didSelectRow(index);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(array[index],style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.normal ,
                  ),),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (ctx,index) {
          return const Divider(height: .0,);
        },
      ),
    );
  }

}
