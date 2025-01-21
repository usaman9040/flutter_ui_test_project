// lib/widgets/chart_widget.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constants.dart';
import '../utils/constants.dart';
import '../viewmodels/credit_score_viewmodel.dart';

class ChartWidget extends ConsumerWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creditScore = ref.watch(creditScoreProvider);
    return Padding(
      padding: ConstantsHelper.screenHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chart',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          22.verticalSpace,
          Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: ConstantsHelper.commonBoxDecoration.copyWith(
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Credit Score',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Updated Today | Next May 12',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ColorConstants.geyTextColor),
                ),
                10.verticalSpace,
                Text(
                  'Experian',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: ColorConstants.primaryColor),
                ),
                16.verticalSpace,
                SizedBox(
                  height: 100.h,
                  width: 1.sw,
                  child: TweenAnimationBuilder<double>(
                    builder: (context, double index, _) {
                      return LineChart(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        LineChartData(
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            verticalInterval: creditScore?.chartInterval,
                            getDrawingHorizontalLine: (value) {
                              return const FlLine(
                                color: Colors.black12,
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return const FlLine(
                                strokeWidth: 0,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  interval: 50,
                                  showTitles: true,
                                  reservedSize: 60,
                                  getTitlesWidget: (value, _) {
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        value.toInt().toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                color: ColorConstants
                                                    .geyTextColor),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          borderData: FlBorderData(
                              show: true,
                              border: const Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.black12, width: 1))),
                          minX: 0,
                          maxX: 11,
                          minY: ConstantsHelper.roundToMultiple(
                              creditScore?.minScore.score.toDouble() ?? 0, 50),
                          maxY: ConstantsHelper.roundToMultiple(
                              creditScore?.maxScore.score.toDouble() ?? 0, 50),
                          lineBarsData: [
                            LineChartBarData(
                              dotData: FlDotData(
                                  show: true,
                                  checkToShowDot: (d, a) => true,
                                  getDotPainter: (spot, d, l, i) =>
                                      FlDotCirclePainter(
                                          color: Colors.white,
                                          radius: 3,
                                          strokeColor:
                                              ColorConstants.secondaryColor,
                                          strokeWidth: 4)),
                              spots: creditScore?.monthScores
                                      .sublist(0, (index * 100).toInt())
                                      .map((e) => FlSpot(
                                          e.monthNumber.toDouble(),
                                          e.score.toDouble()))
                                      .toList() ??
                                  [],
                              color: ColorConstants.secondaryColor,
                              barWidth: 4,
                            ),
                          ],
                        ),
                      );
                    },
                    tween: Tween(begin: 0, end: 0.12),
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                8.verticalSpace,
                Center(
                  child: Text('Last 12 months',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                Center(
                  child: Text(
                    'Score calculated using Vantagecore 3.0',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
