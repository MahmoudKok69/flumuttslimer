import 'package:flumuttslimer/core/app_image.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class HomeUpCard extends StatelessWidget {
  const HomeUpCard({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: SizerUtil.width * 0.9,
      height: SizerUtil.height * 0.3,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Image.asset(
        imageUrl,
        alignment: Alignment.topCenter,
        fit: BoxFit.contain,
      ),
    );
  }
}

class HomeCards extends StatelessWidget {
  HomeCards({super.key});
  List<String> cards = [AppImages.jummaCard];
  @override
  Widget build(BuildContext context) {
    cards = checkDateTimeConditions();
    return Visibility(
      visible: cards.isNotEmpty,
      child: SizedBox(
        height: SizerUtil.height * 0.3,
        width: SizerUtil.width,
        child: PageView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return HomeUpCard(
              imageUrl: cards[index],
            );
          },
        ),
      ),
    );
  }

  List<String> checkDateTimeConditions() {
    List<String> result = [];

    DateTime now = DateTime.now();
    DateTime evening7PM = DateTime(now.year, now.month, now.day, 19, 0);
    DateTime midnight12AM = DateTime(now.year, now.month, now.day + 1, 0, 0);
    DateTime morning4AM = DateTime(now.year, now.month, now.day, 4, 0);
    DateTime noon12PM = DateTime(now.year, now.month, now.day, 12, 0);

    if (now.weekday == DateTime.friday) {
      result.add(AppImages.jummaCard);
    }

    if (now.isAfter(morning4AM) && now.isBefore(noon12PM)) {
      result.add(AppImages.morningCard);
    }
    if (now.isAfter(evening7PM) && now.isBefore(midnight12AM)) {
      result.add(AppImages.morningCard);
    }

    return result;
  }
}
