import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListileHotel extends StatelessWidget {
  const ListileHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        title: Text(
          "Hote Example",
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        subtitle: Text(
          'enjoy your stay in the city',
          style: TextStyle(
              fontWeight: FontWeight.w200,
              color: Colors.black.withOpacity(0.5),
              fontSize: 12.sp),
        ),
        leading: Container(
          height: 10.h,
          width: 20.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://cutewallpaper.org/24/gray-png/remove-google-background-jasongraphix.png'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
