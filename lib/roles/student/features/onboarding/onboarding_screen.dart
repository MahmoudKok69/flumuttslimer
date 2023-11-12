import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/roles/student/router_.dart';
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
          color: white,
          fontSize: 35.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Bahij',
        ),
      ),
      bodyWidget: Text(
        'تطبيق أذكار , التطبيق الأول المهتم بمتابعة تقدمك في الأذكار و حفظ القرأن',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Bahij',
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
          color: white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Bahij',
        ),
      ),
      bodyWidget: Text(
        'أمكانية تلاوة القرأن الكريم داخل التطبيق و مراجعة الأحداث و التقدم',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: white,
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Bahij',
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
          color: white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Bahij',
        ),
      ),
      bodyWidget: Text(
        'تتنافس الطلاب في الطاعات و التفوق في حفظ القرأن و الأذكار و اختبارها',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Bahij',
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
          color: white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Bahij',
        ),
      ),
      bodyWidget: Text(
        'تعليم الأخلاق السليمة و العادات الجمالية للمسلمين',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Bahij',
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
          color: white,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Bahij',
        ),
      ),
      bodyWidget: Text(
        'معلمين يتابعون الطلاب في نشاطهم و يقومون بتقييمهم و إعطاء الدرجات',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Bahij',
        ),
      ),
    ),
    PageViewModel(
      titleWidget: Text(
        'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: white,
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
              backgroundColor: purble4.withOpacity(0.1),
            ),
          ),
          Text(
            'وَفِي ذَٰلِكَ فَلْيَتَنَافَسِ الْمُتَنَافِسُونَ',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
              color: white,
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
          color: white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Amiri',
        ),
      ),
      decoration: PageDecoration(
          bodyFlex: 6,
          footerFlex: 0,
          boxDecoration: BoxDecoration(
              gradient: RadialGradient(colors: [purble3, purble2]))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(Get.size.width);
    print(Get.size.height);
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: pages,
          scrollPhysics: const BouncingScrollPhysics(),
          globalBackgroundColor: purble2,
          showSkipButton: true,
          next: Icon(
            Icons.arrow_forward_ios_rounded,
            color: white,
            size: 20.sp,
          ),
          // showDoneButton: true,

          done: Padding(
            padding: EdgeInsets.only(left: 1.sp),
            child: FittedBox(
              child: Text(
                'الدخول',
                style: TextStyle(
                  color: white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bahij',
                ),
              ),
            ),
          ),
          showDoneButton: true,
          doneStyle: ElevatedButton.styleFrom(backgroundColor: purble1),
          skip: Icon(
            Icons.double_arrow_rounded,
            color: white,
            size: 20.sp,
          ),
          onSkip: () {
            Get.toNamed(AppPages.sLogin);
          },
          onDone: () {
            Get.toNamed(AppPages.sLogin);
          },
          dotsFlex: 0,
          dotsDecorator: DotsDecorator(
            color: purble4,
            activeColor: purble1,
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
      boxDecoration:
          BoxDecoration(gradient: LinearGradient(colors: [purble2, purble3])));
}
