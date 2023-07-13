import 'dart:async';
import 'package:flutter/material.dart';
import 'package:haozuke_test/widgets/page_dot.dart';

class SlideBanner extends StatefulWidget {

  final EdgeInsets? spaceValue;
  final double? cornerRadius;

  const SlideBanner({
    super.key,
    this.spaceValue,
    this.cornerRadius,
  });

  // SlideBanner({super.key}) {
  //   this.spaceValue;
  // }

  @override
  State<SlideBanner> createState() => _SlideBannerState();
}

class _SlideBannerState extends State<SlideBanner> {
  List<String> list = [
    'https://upload-images.jianshu.io/upload_images/127924-dec37275411437de.jpg',
    'http://upload-images.jianshu.io/upload_images/127924-0999617a887bb6a3.jpg',
    'http://upload-images.jianshu.io/upload_images/127924-b48e22b6aef713ae.jpg',
    'http://upload-images.jianshu.io/upload_images/127924-b06e44e6a17caf43.jpg'
  ];

  double dx = 0; //距离
  int curr = 0; //要移出的下标
  int next = 0; //要移入的下标
  bool toLeft = true; //自动播放的方向，默认向左
  late Timer timer;

  dragStart(Offset offset) {
    dx = 0;
  }

  dragUpdate(Offset offset) {
    dx += offset.dx;
  }

  dragEnd(Velocity v) {
    if (dx.abs() < 20) return;
    timer.cancel();
    if (dx < 0) {
      //向左
      if (!toLeft) {
        setState(() {
          toLeft = true;
          curr = next - 1 < 0 ? list.length - 1 : next - 1;
        });
      }
      setState(() {
        curr = next;
        next = (++next) % list.length;
      });
    } else {
      //向右
      if (toLeft) {
        setState(() {
          toLeft = false;
          curr = (next + 1) % list.length;
        });
      }
      setState(() {
        curr = next;
        next = --next < 0 ? list.length - 1 : next;
      });
    }
    //setTimeout
    timer = Timer(const Duration(seconds: 2), autoPlay);
  }

  autoPlay() {
    var second = const Duration(seconds: 2);
    timer = Timer.periodic(second, (t) {
      setState(() {
        toLeft = true;
        curr = next;
        next = (++next) % list.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), autoPlay);
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    const defaultSpace = EdgeInsets.all(10);
    const double defaultCornerRadius = 10;

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (d) { dragStart(d.globalPosition); },
        onHorizontalDragUpdate: (d) { dragUpdate(d.delta); },
        onHorizontalDragEnd: (d) { dragEnd(d.velocity); },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              children: list
                  .asMap()
                  .keys
                  .map((i) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: (i == next || i == curr) ? 600 : 0),
                  curve: Curves.easeIn,
                  transform: Matrix4.translationValues(
                      i == next ? 0 : (i == curr ? (toLeft ? -width : width) : (toLeft ? width : -width)),0,0),
                  width: width,
                  child: Container(
                    padding: widget.spaceValue ?? defaultSpace,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(widget.cornerRadius ?? defaultCornerRadius),
                      ),
                      child: Image.network(
                        list[i],
                        width: width,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              })
                  .toList(),
            ),

            PageDot(num: list.length,currentIndex: curr,),

          ],
        ),
      ),
    );
  }

}
