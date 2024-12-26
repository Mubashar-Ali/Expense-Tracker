import 'package:expanse_tracker/pages/home/transactions_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Statistics",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "All"),
              Tab(text: "Income"),
              Tab(text: "Expense"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _AllTab(),
            _IncomeTab(),
            _ExpenseTab(),
          ],
        ),
      ),
    );
  }
}

class _AllTab extends StatelessWidget {
  const _AllTab();

  @override
  Widget build(BuildContext context) {
    return _StatisticsTab(
      balance: "\$2,000",
      chartWidget: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 40,
              title: 'Entertainment',
              color: Colors.blue,
              radius: 50,
            ),
            PieChartSectionData(
              value: 30,
              title: 'Food',
              color: Colors.green,
              radius: 50,
            ),
            PieChartSectionData(
              value: 20,
              title: 'Shopping',
              color: Colors.orange,
              radius: 50,
            ),
            PieChartSectionData(
              value: 10,
              title: 'Pets',
              color: Colors.purple,
              radius: 50,
            ),
          ],
        ),
      ),
      transactions: const [
        TransactionItem(
          icon: Icons.movie,
          title: "Entertainment",
          subtitle: "Movies at the Mall",
          amount: "-\$120",
          time: "10:00 AM",
          color: Colors.green,
        ),
        TransactionItem(
          icon: Icons.shopping_bag,
          title: "Shopping",
          subtitle: "Shoppers stop clothes",
          amount: "-\$80",
          time: "09:00 PM",
          color: Colors.orange,
        ),
        TransactionItem(
          icon: Icons.fastfood,
          title: "Food",
          subtitle: "Dinner at Kennys",
          amount: "-\$50",
          time: "09:00 PM",
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _IncomeTab extends StatelessWidget {
  const _IncomeTab();

  @override
  Widget build(BuildContext context) {
    return _StatisticsTab(
      balance: "\$10,000",
      chartWidget: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                    toY: 5000,
                    color: Colors.green,
                    width: 30,
                    borderRadius: BorderRadius.circular(4))
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                    toY: 3000,
                    color: Colors.blue,
                    width: 30,
                    borderRadius: BorderRadius.circular(4))
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                    toY: 2000,
                    color: Colors.orange,
                    width: 30,
                    borderRadius: BorderRadius.circular(4))
              ],
            ),
          ],
          titlesData: const FlTitlesData(show: false),
        ),
      ),
      transactions: const [
        TransactionItem(
          icon: Icons.monetization_on,
          title: "Salary",
          subtitle: "Main Income",
          amount: "+\$9,020",
          time: "10:00 AM",
          color: Colors.green,
        ),
        TransactionItem(
          icon: Icons.attach_money,
          title: "Side Hustle",
          subtitle: "Part-time Job",
          amount: "+\$3,000",
          time: "09:00 PM",
          color: Colors.orange,
        ),
        TransactionItem(
          icon: Icons.account_balance_wallet,
          title: "Extra",
          subtitle: "Rental Property",
          amount: "+\$2,500",
          time: "05:00 PM",
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _ExpenseTab extends StatelessWidget {
  const _ExpenseTab();

  @override
  Widget build(BuildContext context) {
    return _StatisticsTab(
      balance: "\$1,500",
      chartWidget: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 50,
              title: 'Food',
              color: Colors.blue,
              radius: 50,
            ),
            PieChartSectionData(
              value: 30,
              title: 'Travel',
              color: Colors.red,
              radius: 50,
            ),
            PieChartSectionData(
              value: 20,
              title: 'Bills',
              color: Colors.orange,
              radius: 50,
            ),
          ],
        ),
      ),
      transactions: const [
        TransactionItem(
          icon: Icons.restaurant,
          title: "Food",
          subtitle: "Dinner at Kennys",
          amount: "-\$150",
          time: "08:00 PM",
          color: Colors.blue,
        ),
        TransactionItem(
          icon: Icons.flight,
          title: "Travel",
          subtitle: "Vacation Tickets",
          amount: "-\$400",
          time: "10:00 AM",
          color: Colors.red,
        ),
        TransactionItem(
          icon: Icons.receipt,
          title: "Bills",
          subtitle: "Electricity Payment",
          amount: "-\$120",
          time: "03:00 PM",
          color: Colors.orange,
        ),
      ],
    );
  }
}

class _StatisticsTab extends StatelessWidget {
  final String balance;
  final Widget chartWidget;
  final List<TransactionItem> transactions;

  const _StatisticsTab({
    required this.balance,
    required this.chartWidget,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: DropdownButton<String>(
                      value: "Weekly",
                      icon: const Icon(Icons.keyboard_arrow_down),
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(
                            value: "Weekly", child: Text("Weekly")),
                        DropdownMenuItem(
                            value: "Monthly", child: Text("Monthly")),
                      ],
                      onChanged: null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: chartWidget,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TransactionsScreen.routeName);
                  },
                  child: const Text("View All"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...transactions,
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final String time;
  final Color color;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        // minTileHeight: 0,
        // contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(amount,
                style: TextStyle(
                    color: amount.startsWith('+') ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold)),
            Text(time,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
