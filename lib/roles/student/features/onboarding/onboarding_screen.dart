import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/router_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  List<PageViewModel> pages = [
    PageViewModel(
      image: Image.asset(
        'assets/images/onboard/onBoard1.png',
        fit: BoxFit.cover,
      ),
      titleWidget: Text(
        'مرحباً!',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 35.sp,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.bj,
        ),
      ),
      bodyWidget: Text(
        'تطبيق أذكار , التطبيق الأول المهتم بمتابعة تقدمك في الأذكار و حفظ القرأن',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.bj,
        ),
      ),
      decoration: getPageDecoration(),
    ),
    PageViewModel(
      image: Image.asset('assets/images/onboard/onBoard2.png'),
      titleWidget: Text(
        'تلاوة القرأن',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.bj,
        ),
      ),
      bodyWidget: Text(
        'أمكانية تلاوة القرأن الكريم داخل التطبيق و مراجعة الأحداث و التقدم',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.bj,
        ),
      ),
      decoration: getPageDecoration(),
    ),
    PageViewModel(
      decoration: getPageDecoration(),
      image: Image.asset('assets/images/onboard/onBoard3.png'),
      titleWidget: Text(
        'منافسة',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.bj,
        ),
      ),
      bodyWidget: Text(
        'تتنافس الطلاب في الطاعات و التفوق في حفظ القرأن و الأذكار و اختبارها',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.bj,
        ),
      ),
    ),
    PageViewModel(
      decoration: getPageDecoration(),
      image: Image.asset('assets/images/onboard/onBoard4.png'),
      titleWidget: Text(
        'تعلم',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.bj,
        ),
      ),
      bodyWidget: Text(
        'تعليم الأخلاق السليمة و العادات الجمالية للمسلمين',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.bj,
        ),
      ),
    ),
    PageViewModel(
      decoration: getPageDecoration(),
      image: Image.asset('assets/images/onboard/onBoard5.png'),
      titleWidget: Text(
        'متابعةالمعلمين',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.bj,
        ),
      ),
      bodyWidget: Text(
        'معلمين يتابعون الطلاب في نشاطهم و يقومون بتقييمهم و إعطاء الدرجات',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.bj,
        ),
      ),
    ),
    PageViewModel(
      titleWidget: Text(
        'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Amiri',
        ),
      ),
      bodyWidget: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 100.sp,
              backgroundColor: AppColors.purble4.withOpacity(0.1),
            ),
          ),
          Text(
            'وَفِي ذَٰلِكَ فَلْيَتَنَافَسِ الْمُتَنَافِسُونَ',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 40.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Amiri',
            ),
          ),
        ],
      ),
      footer: Text(
        'صَدَقَ اللهُ العَظيمُ',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Amiri',
        ),
      ),
      decoration: PageDecoration(
          bodyFlex: 6,
          footerFlex: 0,
          boxDecoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [AppColors.purble3, AppColors.purble2]))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print('width:${Get.size.width}');
    print('width:${Get.size.height}');
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: pages,
          scrollPhysics: const BouncingScrollPhysics(),
          globalBackgroundColor: AppColors.purble2,
          showSkipButton: true,
          next: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.white,
            size: 20.sp,
          ),
          // showDoneButton: true,

          done: Padding(
            padding: EdgeInsets.only(left: 1.sp),
            child: FittedBox(
              child: Text(
                'الدخول',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.bj,
                ),
              ),
            ),
          ),
          showDoneButton: true,
          doneStyle:
              ElevatedButton.styleFrom(backgroundColor: AppColors.purble1),
          skip: Icon(
            Icons.double_arrow_rounded,
            color: AppColors.white,
            size: 20.sp,
          ),
          onSkip: () {
            Get.toNamed(AppPages.welcome);
          },
          onDone: () {
            Get.toNamed(AppPages.welcome);
          },
          dotsFlex: 0,
          dotsDecorator: DotsDecorator(
            color: AppColors.purble4,
            activeColor: AppColors.purble1,
            size: const Size(20, 5),
            activeSize: const Size(12, 12),
          ),
        ),
      ),
    );
  }
}

PageDecoration getPageDecoration() {
  return PageDecoration(
      bodyFlex: 0,
      boxDecoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColors.purble2, AppColors.purble3])));
}
