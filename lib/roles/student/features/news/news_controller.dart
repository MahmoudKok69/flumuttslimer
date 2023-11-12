import 'package:flumuttslimer/roles/student/features/news/models/news_model.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  List<NewsModel> news = [
    NewsModel(
      author: 'أ. محمد المحمد',
      date: DateTime(2023, 11, 2),
      isExpanded: false,
      content:
          'سيتم تسميع جزء عم لجميع الطلاب التي غابت في الأسبوع الماضي  في فئة عباد الرحمن و فئة قلوب الأيمان , الرجاء مم الجميع الحضور.\nفي أمان الله',
    ),
    NewsModel(
      author: 'أ. محمد المحمد',
      date: DateTime(2023, 11, 2),
      isExpanded: false,
      content:
          'سيتم تسميع جزء عم لجميع الطلاب التي غابت في الأسبوع الماضي  في فئة عباد الرحمن و فئة قلوب الأيمان , الرجاء مم الجميع الحضور.\nفي أمان الله',
    ),
    NewsModel(
        author: 'أ. محمد المحمد',
        date: DateTime(2023, 11, 2),
        isExpanded: false,
        content:
            'نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص نص '),
    NewsModel(
      author: 'أ. محمد المحمد',
      date: DateTime(2023, 11, 2),
      isExpanded: false,
      content:
          'سيتم تسميع جزء عم لجميع الطلاب التي غابت في الأسبوع الماضي  في فئة عباد الرحمن و فئة قلوب الأيمان , الرجاء مم الجميع الحضور.\nفي أمان الله',
    ),
    NewsModel(
      author: 'أ. محمد المحمد',
      date: DateTime(2023, 11, 2),
      isExpanded: false,
      content:
          'سيتم تسميع جزء عم لجميع الطلاب التي غابت في الأسبوع الماضي  في فئة عباد الرحمن و فئة قلوب الأيمان , الرجاء مم الجميع الحضور.\nفي أمان الله',
    ),
  ];

  changeNewsExpand(index) {
    news[index].isExpanded = !news[index].isExpanded;
    update(['update_news_expand']);
  }
}
