import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/fonts_style.dart';
import 'balance_widget.dart';
import 'expense_tile_widget.dart';
import 'percents_widget.dart';
import 'my_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            verticalSpace(10),
            const MyAppBar(),
            verticalSpace(10),
            const BalanceWidget(),
            verticalSpace(20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Top Transactions",
                style: FontsStyle.font18BoldWhite,
              ),
            ),
            verticalSpace(20),
            const PercentsWidget(),
            verticalSpace(20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest Transactions",
                style: FontsStyle.font18BoldWhite,
              ),
            ),
            verticalSpace(20),
            Container(
              height: 190.h,
              child: ListView(
                children: const [
                  ExpenseTileWidget(),
                  ExpenseTileWidget(),
                  ExpenseTileWidget(),
                  ExpenseTileWidget(),
                  ExpenseTileWidget(),
                  ExpenseTileWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
