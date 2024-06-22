import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/common/color-extension.dart';

List _tripsList = [
  TripListItem("1:30", "Khartoum", "50.00\$", "Paid by cash", true),
  TripListItem("2:30", "Khartoum", "90.00\$", "Paid by cash", true),
  TripListItem("3:00", "Khartoum", "30.00\$", "Paid by cash", true),
  TripListItem("4:30", "Khartoum", "25.00\$", "Paid by cash", true),
  TripListItem("10:30", "Khartoum", "50.00\$", "Paid by cash", false),
  TripListItem("10:30", "Khartoum", "50.00\$", "Paid by cash", false),
  TripListItem("10:30", "Khartoum", "50.00\$", "Paid by cash", false),
  TripListItem("10:30", "Khartoum", "50.00\$", "Paid by cash", false),
  TripListItem("10:30", "Khartoum", "50.00\$", "Paid by cash", false),
  TripListItem("10:30", "Khartoum", "50.00\$", "Paid by cash", false),
  TripListItem("10:30", "Khartoum", "50.00\$", "Paid by cash", false),
  TripListItem("10:30", "Khartoum", "50.00\$", "Paid by cash", false),
];

class SummaryPage extends StatefulWidget {
  SummaryPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => SummaryPage(),
      );

  final Color barBackgroundColor = Colors.black.withOpacity(0.3);
  final Color barColor = Colors.black;
  final Color touchedBarColor = TColor.primary;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          title: Text(
            "Summary",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "Normal",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: TColor.primary),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: TColor.primary,
                  ),
                  const SizedBox(
                    width: 6,
                  )
                ],
              ),
            )
          ],
          bottom: TabBar(
            dividerColor: Colors.white60,
            dividerHeight: 6,
            indicatorColor: TColor.primary,
            indicatorWeight: 6,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: TColor.primary,
            tabs: const [
              Tab(
                  child: Text(
                "Today",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Tab(
                  child: Text(
                "Weekly",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    headerPage(false),
                    summaryTable(),
                    receiptSummaryFooter(context,false),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          headerPage(true),
                          SizedBox(
                            height: context.height - 700,
                            child: BarChart(
                              mainBarData(),
                            ),
                          ),
                          summaryTable(),
                          receiptSummaryFooter(context,true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 40,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor)
              : const BorderSide(color: Colors.black, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5,
                isTouched: i == touchedIndex,
                barColor: TColor.secondaryText,
                width: 25);
          case 1:
            return makeGroupData(1, 6.5,
                isTouched: i == touchedIndex,
                barColor: TColor.secondaryText,
                width: 25);
          case 2:
            return makeGroupData(2, 5,
                isTouched: i == touchedIndex,
                barColor: TColor.secondaryText,
                width: 25);
          case 3:
            return makeGroupData(3, 7.5,
                isTouched: i == touchedIndex,
                barColor: TColor.secondaryText,
                width: 25);
          case 4:
            return makeGroupData(4, 10,
                isTouched: i == touchedIndex,
                barColor: TColor.secondaryText,
                width: 25);
          case 5:
            return makeGroupData(5, 9.5,
                isTouched: i == touchedIndex,
                barColor: TColor.secondaryText,
                width: 25);
          case 6:
            return makeGroupData(6, 6.5,
                isTouched: i == touchedIndex,
                barColor: TColor.secondaryText,
                width: 25);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.black, //widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
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
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 30,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 3,
      child: text,
    );
  }
}

Widget headerPage(bool isWeekly) {
  return Column(
    children: [
      const SizedBox(
        height: 24,
      ),
      (isWeekly)
          ? Text(
              DateFormat(
                "EEE,d MMM''yy",
              ).format(DateTime.now()),
              style: const TextStyle(fontSize: 20),
            )
          : Text(
              DateFormat(
                "EEE,d MMM''yy",
              ).format(DateTime.now()
                  .subtract(Duration(days: DateTime.now().weekday - 1))),
              style: const TextStyle(fontSize: 20),
            ),
      const SizedBox(
        height: 6,
      ),
      RichText(
        text: TextSpan(
          text: "54,74",
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text: " \$",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: TColor.primary,
                  textBaseline: TextBaseline.alphabetic),
            )
          ],
        ),
      ),
    ],
  );
}

Widget summaryTable() {
  return const Column(
    children: [
      Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  "15",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("Trips"),
              ],
            ),
          ),
          SizedBox(height: 80, child: VerticalDivider()),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text("9:32",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text("Online hrs"),
              ],
            ),
          ),
          SizedBox(height: 80, child: VerticalDivider()),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text("42.48\$",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text("Cash Tirp"),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget receiptSummaryFooter(BuildContext context,bool isWeekly) {
  return Column(
    children: [
      Container(
        width: context.width,
        height: 50,
        color: Colors.grey.shade200,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "TRIPS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      SizedBox(
        height: (!isWeekly) ? context.height-400:context.height - 700,
        child: ListView.builder(
          itemBuilder: (context, index) {
            var item = _tripsList[index] as TripListItem;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            item.time,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(5),
                              color: TColor.placeholder.withAlpha(80),
                            ),
                            child: Text((item.isAM) ? "AM" : "PM"),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.locationName,style: const TextStyle(fontWeight: FontWeight.bold),),
                          Text(item.details)
                        ],
                      ),
                      const Spacer(),
                      Text(item.price,style: const TextStyle(fontWeight:FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  Divider()
                ],
              ),
            );
          },
          itemCount: _tripsList.length,
        ),
      ),
    ],
  );
}

class DataItem {
  int x;
  double y1;
  double y2;
  double y3;

  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}

class TripListItem {
  final String time, locationName, price, details;
  final bool isAM;

  TripListItem(
      this.time, this.locationName, this.price, this.details, this.isAM);
}
