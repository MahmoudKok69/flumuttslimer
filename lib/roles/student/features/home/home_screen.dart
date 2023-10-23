import 'package:flumuttslimer/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SHomeScreen extends StatelessWidget {
  SHomeScreen({super.key});
  List<List<String>> home = [
    ['الأذكار', 'path'],
    ['القران', 'path'],
    ['الجمال', 'path'],
    ['مركزي', 'path'],
    ['الأذكار', 'path'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.sp,
          crossAxisSpacing: 10.sp,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: purble2,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Column(children: [
              Image.asset(
                home[index][1],
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                home[index][0],
              )
            ]),
          );
        },
      ),
    );
  }
}
