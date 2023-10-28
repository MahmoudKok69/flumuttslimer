import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_styles.dart';
import 'package:flumuttslimer/core/strings.dart';
import 'package:flumuttslimer/roles/student/features/Quran/Quran.dart';
import 'package:flumuttslimer/roles/student/features/Quran/models/Quran_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SorahScreen extends StatelessWidget {
  SorahScreen({super.key});
  var data = Get.parameters;

  @override
  Widget build(BuildContext context) {
    var item = QuranModel.fromJson(Quran[int.parse(data['number']!)]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purble2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'سورة ${item.name}',
            textAlign: TextAlign.right,
            style: TextStyle(
                color: white,
                fontFamily: um,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.size.width,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/sorah/headFrame_G_l.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/sorah/headFrame_G_line.png',
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: Text(BESMILAH,
                              style: TextStyle(
                                fontFamily: um,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Image.asset(
                          'assets/images/sorah/headFrame_G_line.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/sorah/headFrame_G_r.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.sp),
              child: SelectableText(
                replaceIndicesWithAyahMarkers(item.ar),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontFamily: um,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            // Wrap(
            //   alignment: WrapAlignment.center,
            //   spacing: 10.sp,
            //   runSpacing: 10.sp,
            //   children: item.array
            //       .skip(1)
            //       .map((element) => Row(
            //             children: [
            //               Icon(
            //                 Icons.star,
            //                 color: black,
            //               ),
            //               Text(
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //                 element.ar.toString(),
            //                 style: TextStyle(fontFamily: um, fontSize: 15.sp),
            //               ),
            //             ],
            //           ))
            //       .toList(),
            // ),

            SizedBox(
              width: Get.size.width,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/sorah/headFrame_G_l.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/sorah/headFrame_G_line.png',
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: Text(SADAKALLAH,
                              style: TextStyle(
                                fontFamily: um,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Image.asset(
                          'assets/images/sorah/headFrame_G_line.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/sorah/headFrame_G_r.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String replaceIndicesWithAyahMarkers(String input) {
  List<String> parts = input.split(RegExp(r'\(\d+\)'));
  List<String> indices = RegExp(r'\(\d+\)').allMatches(input).map((match) {
    final index = int.parse(match.group(0)!.replaceAll(RegExp(r'[()]'), ''));
    return insertIndexInsideAyahMarker(index);
  }).toList();

  String result = '';

  for (int i = 0; i < parts.length; i++) {
    result += parts[i];
    if (i < indices.length) {
      result += indices[i];
    }
  }

  return result;
}

String insertIndexInsideAyahMarker(int index) {
  // Define Arabic digits for conversion
  List<String> arabicDigits = [
    "٠",
    "١",
    "٢",
    "٣",
    "٤",
    "٥",
    "٦",
    "٧",
    "٨",
    "٩"
  ];

  // Convert the index to Arabic numerals
  String arabicIndex = indexToArabic(index, arabicDigits);

  // Create the modified ayah marker with the Arabic index inside
  String modifiedAyahMarker = "$arabicIndex";

  return modifiedAyahMarker;
}

String indexToArabic(int index, List<String> arabicDigits) {
  // Convert the index to Arabic numerals
  String arabicIndex = "";
  while (index > 0) {
    int digit = index % 10;
    arabicIndex = arabicDigits[digit] + arabicIndex;
    index ~/= 10;
  }
  return arabicIndex.isEmpty ? arabicDigits[0] : arabicIndex;
}