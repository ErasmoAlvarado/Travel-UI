import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

class PlaceCard extends StatefulWidget {
  const PlaceCard({Key? key}) : super(key: key);

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Container(
            width: 100.w,
            height: 29.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 32.w),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              width: 25.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    'example place',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    'Come here and enjoy:)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10.sp,
                                        color: Colors.black.withOpacity(0.5)),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    createStar(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
                        child: Column(
                          children: [
                            Text(
                              '€${math.Random().nextInt(500)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                            Text(
                              'per day',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.sp,
                                  color: Colors.black.withOpacity(0.5)),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Container(
            height: 25.h,
            width: 35.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://cutewallpaper.org/24/gray-png/remove-google-background-jasongraphix.png"),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Row(
            children: [
              const Chip(
                label: Text("7:00 am"),
                backgroundColor: Color.fromARGB(255, 165, 214, 255),
              ),
              SizedBox(width: 2.w),
              const Chip(
                label: Text("7:00 am"),
                backgroundColor: Color.fromARGB(255, 165, 214, 255),
              ),
            ],
          ),
        )
      ],
    );
  }
}

String createStar() {
  int number = math.Random().nextInt(5);
  String star = '';
  for (var i = 0; i < number; i++) {
    star = "$star ⭐";
  }
  return star;
}
