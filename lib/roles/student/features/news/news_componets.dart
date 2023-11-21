import 'package:flumuttslimer/core/colors.dart';
import 'package:flumuttslimer/core/font_family.dart';
import 'package:flumuttslimer/roles/student/features/news/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NewsBody extends StatelessWidget {
  NewsBody({super.key});
  final _controller = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: ListView.builder(
        itemCount: _controller.news.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _controller.news[index];
          return NewsCard(
            index: index,
          );
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  NewsCard({super.key, this.index});
  final index;

  final _controller = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    var item = _controller.news[index];
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, left: 2.w, right: 2.w),
      child: Container(
          decoration: BoxDecoration(
              color: white,
              border: Border.all(width: 0.25.w, color: black),
              boxShadow: [
                BoxShadow(color: black.withOpacity(0.4), blurRadius: 1),
              ],
              borderRadius: BorderRadius.circular(5.sp)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.5.h),
                  child: Text(
                    item.author!,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: bj),
                  ),
                ),
                Text(
                  '${item.date!.year}/${item.date!.month}/${item.date!.day}',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: grey2,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: bj),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                GetBuilder(
                    id: 'update_news_expand',
                    init: NewsController(),
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: Get.size.width,
                            child: Text(
                              item.content!,
                              textDirection: TextDirection.rtl,
                              maxLines: item.isExpanded ? 3 : 100,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: grey1,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: bj),
                            ),
                          ),
                          Visibility(
                            visible: checkTextOverFlow(item.content!, 12.sp),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: TextButton(
                                  onPressed: () {
                                    _controller.changeNewsExpand(index);
                                  },
                                  child: item.isExpanded
                                      ? const Text('قراءة المزيد')
                                      : const Text('قراءة أقل')),
                            ),
                          ),
                        ],
                      );
                    }),
                SizedBox(height: 2.h),
              ],
            ),
          )),
    );
  }

  bool checkTextOverFlow(String text, double fontSize) {
    var span = TextSpan(text: text, style: TextStyle(fontSize: fontSize));
    var tp = TextPainter(
        maxLines: 3,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        text: span)
      ..layout(maxWidth: 200.w);
    print(text);
    print(tp.didExceedMaxLines);

    return tp.didExceedMaxLines;
  }
}
