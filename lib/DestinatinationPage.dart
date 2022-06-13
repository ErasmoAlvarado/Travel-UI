import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_travel/placeCard.dart';

class Destination extends StatelessWidget {
  const Destination({Key? key, required this.count}) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 45.h,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cutewallpaper.org/24/gray-png/remove-google-background-jasongraphix.png"),
                        fit: BoxFit.cover)),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(FontAwesomeIcons.arrowLeft),
                iconSize: 3.h,
              ),
              Positioned(
                right: 2,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.search),
                      iconSize: 3.h,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.list),
                      iconSize: 3.h,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                child: Padding(
                  padding: EdgeInsets.all(3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' destination',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidPaperPlane,
                              color: Colors.white,
                              size: 3.h,
                            ),
                            Text(
                              'Default city',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.sp,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 2,
                  bottom: 2,
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(Icons.place),
                      iconSize: 3.h,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: count,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: const PlaceCard(),
              );
            },
          ))
        ],
      ),
    );
  }
}
