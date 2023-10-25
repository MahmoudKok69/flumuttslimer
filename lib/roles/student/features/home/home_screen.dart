import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/roles/student/features/home/home_model/main_pages.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SHomeScreen extends StatelessWidget {
  SHomeScreen({super.key});
  var home = [
    MainPages(name: 'القرأن', image: '', page: AppPages.sQuran),
    MainPages(name: 'الأذكار', image: '', page: AppPages.sAzkar),
    MainPages(name: 'الأخلاق و الجمال', image: '', page: AppPages.beuati),
    MainPages(name: 'القرأن', image: '', page: ''),
    MainPages(name: 'القرأن', image: '', page: ''),
    MainPages(name: 'القرأن', image: '', page: ''),
    MainPages(name: 'القرأن', image: '', page: ''),
    MainPages(name: 'القرأن', image: '', page: ''),
    MainPages(name: 'القرأن', image: '', page: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purble2,
        title: Center(
          child: Text(
            'الواجهة الرئيسية ',
            style: TextStyle(
              color: white,
              fontFamily: bj,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actionsIconTheme: IconThemeData(color: white),
        automaticallyImplyLeading: false,
      ),
      endDrawer: SizedBox(
        width: 70.w,
        child: Drawer(
            backgroundColor: white,
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Column(
                children: [
                  Container(
                    height: 30.h,
                    width: 70.w,
                    child: Icon(
                      Icons.person,
                      color: white,
                      size: 152.24.sp,
                    ),
                    decoration: BoxDecoration(
                      color: purble2,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DrawerOption(
                      "الخيار الأول",
                      Icon(
                        Icons.onetwothree_outlined,
                        size: 30.sp,
                      ),
                      'page'),
                  DrawerOption(
                      "الخيار الثاني",
                      Icon(
                        Icons.onetwothree_outlined,
                        size: 30.sp,
                      ),
                      'page'),
                  DrawerOption(
                      "الخيار الثالث",
                      Icon(
                        Icons.onetwothree_outlined,
                        size: 30.sp,
                      ),
                      'page'),
                  Divider(
                    thickness: 1.sp,
                  ),
                ],
              ),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.sp,
            crossAxisSpacing: 10.sp,
          ),
          itemCount: home.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: purble2,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: FittedBox(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(home[index].page!);
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 25.w,
                          height: 20.h,
                          decoration: BoxDecoration(color: orange1),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          home[index].name!,
                          style: TextStyle(
                              color: white,
                              fontSize: 20.sp,
                              fontFamily: bj,
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

DrawerOption(String name, Icon icon, String page) {
  return Column(
    children: [
      Divider(
        thickness: 1.sp,
      ),
      SizedBox(
        height: 2.h,
      ),
      FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            SizedBox(
              width: 2.w,
            ),
            Text(
              name,
              style: TextStyle(
                color: purble1,
                fontFamily: bj,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
