import 'package:flutter/material.dart';
import 'package:ms_taxi/components/widgets/base_app_bar.dart';
import 'package:ms_taxi/components/widgets/expansion_tile.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  static const route = '/statistics';

  final tit1 = '08.2023:';
  final sub1 = '(58ТМТ - 13.4км)';

  final subTit1 = '13 авг:';
  final subSub1 = '(58ТМТ - 13.4км)';

  final tit2 = '09.2023:';
  final sub2 = '(101ТМТ - 15.4км)';

  final subTit2 = '13 sen:';
  final subSub2 = '(58ТМТ - 13.4км)';

  final tit3 = '10.2023';
  final sub3 = '(10ТМТ - 1.4км)';

  final subTit3 = '13 okt:';
  final subSub3 = '(58ТМТ - 13.4км)';

  final detTit3 = '10:05 - 10:57 (сиенна)';
  final detSub3 = '(58ТМТ - 13.4км)';
  final detTit4 = '13:49 - 14:07 (VIP)';
  final detSub4 = '(58ТМТ - 13.4км)';

// (28ТМТ - 23км)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'Cтатистика',
      ).toPreferredSize,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomExpansionTile(
              title: tit1,
              subtitle: sub1,
              children: [
                CustomExpansionTile(
                  title: subTit1,
                  subtitle: subSub1,
                ),
                CustomExpansionTile(
                  title: subTit2,
                  subtitle: subSub2,
                ),
                CustomExpansionTile(
                  title: subTit3,
                  subtitle: subSub3,
                ),
              ],
            ),
            CustomExpansionTile(
              title: tit2,
              subtitle: sub2,
            ),
            CustomExpansionTile(
              title: tit3,
              subtitle: sub3,
              children: [
                CustomExpansionTile(
                  title: subTit1,
                  subtitle: subSub1,
                  // isDetailedChild: true,
                  children: [
                    CustomExpansionTile(
                      title: subTit1,
                      subtitle: subSub1,
                      isDetailedChild: true,
                    ),
                    CustomExpansionTile(
                      title: subTit2,
                      isDetailedChild: true,
                      subtitle: subSub2,
                    ),
                    CustomExpansionTile(
                      title: subTit3,
                      isDetailedChild: true,
                      subtitle: subSub3,
                    ),
                  ],
                ),
                CustomExpansionTile(
                  title: subTit2,
                  subtitle: subSub2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
