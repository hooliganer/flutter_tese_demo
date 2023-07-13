import 'dart:async';
import 'package:flutter/material.dart';

class OpacityBanner extends StatefulWidget {
  const OpacityBanner({super.key});

  @override
  State<OpacityBanner> createState() => _OpacityBannerState();
}

class _OpacityBannerState extends State<OpacityBanner> {
  int zIndex = 0;
  List<String> list = [
    'https://upload-images.jianshu.io/upload_images/127924-dec37275411437de.jpg',
    'http://upload-images.jianshu.io/upload_images/127924-0999617a887bb6a3.jpg',
    'http://upload-images.jianshu.io/upload_images/127924-b48e22b6aef713ae.jpg',
    'http://upload-images.jianshu.io/upload_images/127924-b06e44e6a17caf43.jpg',
  ];
  late Timer timer;

  autoPlay() {
    var sec = const Duration(seconds: 2);
    timer = Timer.periodic(sec, (timer) {
      setState(() {
        zIndex = (++zIndex) % list.length;
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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [

          Stack(
            children: list
                .asMap()
                .keys
                .map((i) => AnimatedOpacity(
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 600),
                      opacity: i == zIndex ? 1 : 0,
                      child: Image.network(
                        list[i],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Container(
                      //   color: Color(int.parse(list[i], radix: 16)).withAlpha(255),
                      //   height: 300,
                      // ),
                    ))
                .toList(),
          ),

          Positioned(
            bottom: 20,
            child: Row(
              children: list
                  .asMap()
                  .keys
                  .map((i) => Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: i == zIndex ? Colors.blue : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ))
                  .toList(),
            ),
          ),

        ],
      ),
    );
  }
}
