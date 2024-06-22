import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/features/menu/presentations/pages/add_money_page.dart';

List _walletActionsList = [
  WalletActionItem(
      "123456789",
      0,
      50.20,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "987654321",
      2,
      60.00,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "654789321",
      1,
      12.36,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "456159357",
      1,
      40.32,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "123456789",
      0,
      50.20,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "987654321",
      2,
      60.00,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "654789321",
      1,
      12.36,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "456159357",
      1,
      40.32,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "123456789",
      0,
      50.20,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "987654321",
      2,
      60.00,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "654789321",
      1,
      12.36,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
  WalletActionItem(
      "456159357",
      1,
      40.32,
      DateFormat("MMM d, ''yy").format(
          DateTime.now().subtract(Duration(days: Random().nextInt(30))))),
];

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const WalletPage(),
      );

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(
          "My wallet",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
                child: Text(
              "Total balance",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: TColor.secondaryText),
            )),
            const Text(
              "4250.00\$",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 32,
            ),
            Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              "WITHDRAW",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: TColor.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80, child: VerticalDivider()),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, AddMoneyPage.route());
                        },
                        child: Column(
                          children: [
                            Text(
                              "ADD MONEY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: TColor.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                SizedBox(
                  height: context.height - 200,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var item = _walletActionsList[index] as WalletActionItem;
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon((item.typeId == 0)
                                    ? Icons.wallet
                                    : (item.typeId == 1)
                                        ? Icons.car_crash
                                        : Icons.account_balance),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (item.typeId == 0)
                                          ? "Added to Wallet"
                                          : (item.typeId == 1)
                                              ? "Trip Deducted"
                                              : "Withdraw to Wallet",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("${item.date} • #${item.id}")
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "${item.amount} \$",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      );
                    },
                    itemCount: _walletActionsList.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WalletActionItem {
  final int typeId;
  final String date, id;
  final double amount;

  WalletActionItem(this.id, this.typeId, this.amount, this.date);
}
