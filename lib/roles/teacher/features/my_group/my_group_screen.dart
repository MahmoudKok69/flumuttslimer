import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/beauti/beauti_components.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flumuttslimer/roles/teacher/my_group/my_group_controller.dart';
import 'package:flumuttslimer/roles/teacher/my_group/widgets/my_group_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TeacherGroupsScreen extends StatelessWidget {
  TeacherGroupsScreen({
    super.key,
    this.categ,
    this.count_students,
    this.name_institute,
    this.name_group,
    this.invite_url,
    this.max_members,
    this.isPrivate,
    this.isAvailable,
  });
  String? categ;
  int? count_students;
  String? name_institute;
  String? name_group;
  String? invite_url;
  int? max_members;
  bool? isPrivate;
  bool? isAvailable;
  var data = Get.parameters;
  var data2 = Get.arguments;

  final _controller = Get.find<TeacherGroupsController>();
  var userInde = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purble2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.white,
            size: 16.sp,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.link,
                color: AppColors.white,
                size: 16.sp,
              )),
          IconButton(
              onPressed: () {
                print(data2);
                Get.toNamed(AppPages.update_info_group, arguments: {
                  data2.categ,
                  data2.count_students,
                  data2.name_institute,
                  data2.name_group,
                  data2.invite_url,
                  data2.max_members,
                  data2.isPrivate,
                  data2.isAvailable
                });
              },
              icon: Icon(
                Icons.edit,
                color: AppColors.white,
                size: 16.sp,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppColors.white,
                size: 16.sp,
              )),
        ],
      ),
      body: ListView(children: [
        info_group(data: data),
        ..._controller.List_student.map((e) {
          userInde++;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.4),
                    blurRadius: 1,
                    offset: const Offset(2, 3),
                    spreadRadius: 1,
                  )
                ],
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: ListTile(
                  onTap: () {
                    Get.toNamed(AppPages.tstudent_profile, parameters: {
                      'path_image': e.path_image!,
                      'name_student': e.name_student!,
                      'age': e.age.toString()!,
                      'points': e.points.toString()!,
                      'country': e.country!,
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  tileColor: AppColors.white,
                  style: ListTileStyle.list,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.purble1),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                '${userInde}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.orange1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            e.name_student!,
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: AppFonts.bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'العمر : ${e.age.toString()}',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: AppFonts.bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'عدد النقاط :${e.points.toString()}',
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: AppFonts.bj,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 100.sp,
                          width: 100.sp,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.purble4),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        }),
      ]),
    );
  }
}
