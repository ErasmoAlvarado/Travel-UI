import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

import 'package:ui_travel/DestinatinationPage.dart';

class CarouselCard extends StatefulWidget {
  const CarouselCard({Key? key}) : super(key: key);

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  final ramdon = math.Random().nextInt(99);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Destination(
                      count: ramdon,
                    )),
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18.h),
              child: Container(
                height: 15.h,
                width: 50.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '$ramdon destination',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Text(
                        'a city of diversity and dynamism. Come here :)',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp,
                            color: Colors.black.withOpacity(0.5)),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Container(
                height: 22.h,
                width: 45.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://cutewallpaper.org/24/gray-png/remove-google-background-jasongraphix.png'),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
