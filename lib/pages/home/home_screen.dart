import 'package:expanse_tracker/core/components/goal_tile.dart';
import 'package:expanse_tracker/core/components/income_expense_row.dart';
import 'package:expanse_tracker/core/components/section_tile.dart';
import 'package:expanse_tracker/core/components/total_balance_tile.dart';
import 'package:expanse_tracker/pages/home/add_budget.dart';
import 'package:expanse_tracker/pages/home/all_goals.dart';
import 'package:expanse_tracker/pages/home/budgets_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "Home_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
          ),
        ),
        titleSpacing: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            Text(
              "Charles David",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.notification),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 100),
        child: Column(
          children: [
            const TotalBalanceTile(),
            const SizedBox(height: 20),
            const IncomeExpenseRow(),
            const SizedBox(height: 10),
            const SectionTitle(title: "Expense Chart"),
            const SizedBox(height: 10),
            const ExpenseChart(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionTitle(title: "Goals"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllGoals.routeName);
                  },
                  child: const Text("View All"),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: GoalsList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionTitle(title: "Budgets"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllGoals.routeName);
                  },
                  child: const Text("View All"),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: BudgetListScreen(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, AddBudget.routeName);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Weekly"),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 350,
              child: LineChart(LineChartData(
                gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withValues(alpha: 0.3),
                      strokeWidth: 1,
                    );
                  },
                  drawVerticalLine: true,
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, _) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text('\$0',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 100:
                            return const Text('\$100',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 200:
                            return const Text('\$200',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 300:
                            return const Text('\$300',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 400:
                            return const Text('\$400',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 500:
                            return const Text('\$500',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      getTitlesWidget: (value, _) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text('Sun',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 1:
                            return const Text('Mon',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 2:
                            return const Text('Tue',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 3:
                            return const Text('Wed',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 4:
                            return const Text('Thu',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 5:
                            return const Text('Fri',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          case 6:
                            return const Text('Sat',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey));
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 500,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 350),
                      FlSpot(1, 100),
                      FlSpot(2, 200),
                      FlSpot(3, 300),
                      FlSpot(4, 250),
                      FlSpot(5, 400),
                      FlSpot(6, 200),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 4,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.withValues(alpha: 0.2),
                    ),
                    dotData: const FlDotData(
                      show: true,
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
