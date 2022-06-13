import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_travel/carouselCard.dart';
import 'package:ui_travel/listtileHotel.dart';
import 'package:ui_travel/tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: const HomePage(),
          theme: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        );
      },
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 165, 214, 255),
            unselectedItemColor: Colors.grey[400],
            onTap: (index) {
              ref.read(ProviderBottonNavegator.notifier).change(index);
            },
            currentIndex: ref.watch(ProviderBottonNavegator),
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.search), label: "Home"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.pizzaSlice), label: "More"),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cutewallpaper.org/24/gray-png/remove-google-background-jasongraphix.png"),
                  ),
                  label: "Perfil")
            ],
          ),
          body: SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 4.h, left: 4.w, right: 4.w, bottom: 1.h),
                  child: Text(
                    "What you would like to find?",
                    style:
                        TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                TabBar(
                    physics: const BouncingScrollPhysics(),
                    onTap: (value) {
                      ref.read(ProviderTabButtom.notifier).change(value);
                      print(value);
                    },
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    indicatorColor: Colors.transparent,
                    labelPadding: EdgeInsets.zero,
                    splashBorderRadius: BorderRadius.circular(60),
                    indicatorWeight: 4,
                    tabs: [
                      Tab(
                          height: 11.h,
                          child: const TabButtom(
                            index: 0,
                            icon: FontAwesomeIcons.plane,
                          )),
                      Tab(
                          height: 11.h,
                          child: const TabButtom(
                            index: 1,
                            icon: FontAwesomeIcons.walking,
                          )),
                      Tab(
                          height: 11.h,
                          child: const TabButtom(
                            index: 2,
                            icon: FontAwesomeIcons.car,
                          )),
                      Tab(
                          height: 11.h,
                          child: const TabButtom(
                            index: 3,
                            icon: FontAwesomeIcons.biking,
                          )),
                    ]),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Destinations',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'incomplete',
                              backgroundColor: Colors.black.withOpacity(0.5));
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: const Color.fromARGB(255, 165, 214, 255)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 35.h,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CarouselCard(),
                      CarouselCard(),
                      CarouselCard(),
                      CarouselCard()
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Hotel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'incomplete',
                              backgroundColor: Colors.black.withOpacity(0.5));
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: const Color.fromARGB(255, 165, 214, 255)),
                        ),
                      ),
                    ],
                  ),
                ),
                const ListileHotel(),
                const ListileHotel(),
                const ListileHotel(),
                const ListileHotel(),
              ],
            ),
          )),
    );
  }
}

class TabButtom extends StatelessWidget {
  const TabButtom({Key? key, required this.index, required this.icon})
      : super(key: key);
  final int index;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: index == ref.watch(ProviderTabButtom) ? 11.h : 10.h,
              width: index == ref.watch(ProviderTabButtom) ? 21.w : 20.w,
              decoration: BoxDecoration(
                  color: index == ref.watch(ProviderTabButtom)
                      ? const Color.fromARGB(255, 162, 213, 255)
                      : const Color.fromARGB(255, 209, 209, 209),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: FaIcon(
                  icon,
                  color: index == ref.watch(ProviderTabButtom)
                      ? const Color.fromARGB(255, 53, 76, 95)
                      : const Color.fromARGB(255, 177, 177, 177),
                  size: 4.h,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
