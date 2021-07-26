import 'package:summary/features/models/wealth_summary_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summary/core/constants/strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:summary/core/shared/helpers.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  SummaryCard({
    Key? key,
    required this.wealthSummary,
  }) : super(key: key);

  final List<WealthSummary> wealthSummary;

  @override
  Widget build(BuildContext context) {
    if (wealthSummary.isNotEmpty) {
      final firstSummary = wealthSummary.first;

      return Container(
        height: 352.0.h,
        width: 344.h.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0.h),
        ),
        child: Column(
          children: [
            _cardHeader(context),
            _amountInvested(context),
            _totalValue(context, value: firstSummary.total),
            SizedBox(height: 28.0.h),
            _optionsList(
              context,
              key: CardSummeryStrings.profitability,
              value: Helpers.formatProfitability(
                firstSummary.profitability.toString(),
              ),
            ),
            _optionsList(
              context,
              key: CardSummeryStrings.cdi,
              value: Helpers.formatCDI(
                firstSummary.cdi,
              ),
            ),
            _optionsList(
              context,
              value: Helpers.formatGain(firstSummary.gain),
              key: CardSummeryStrings.gain,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.5.w),
              child: Divider(),
            ),
            _seeMoreButton(context),
          ],
        ),
      );
    }
    return Center(
      child: AutoSizeText(
        GeneralStrings.noInternetConnection,
      ),
    );
  }

  Widget _cardHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 3.0.h,
        right: 16.5.w,
        left: 24.0.w,
        top: 25.0.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            CardSummeryStrings.yourResume,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Icon(
            Icons.more_vert,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _amountInvested(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 35.0.h,
      ),
      alignment: Alignment.center,
      child: AutoSizeText(
        CardSummeryStrings.amountInvested,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Color(0XFF606377),
            ),
      ),
    );
  }

  Widget _totalValue(BuildContext context, {required int value}) {
    return Container(
      margin: EdgeInsets.only(
        top: 7.0.h,
      ),
      alignment: Alignment.center,
      child: AutoSizeText(
        Helpers.formatTotalInvested(value),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: 22.sp,
            ),
      ),
    );
  }

  Widget _optionsList(
    BuildContext context, {
    required String key,
    required dynamic value,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 23.5.w,
        vertical: 6.0.h,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            key,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Color(0XFF606377),
                ),
          ),
          AutoSizeText(
            value.toString(),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.sp,
                ),
          ),
        ],
      ),
    );
  }

  Widget _seeMoreButton(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 23.5.w),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(4.0.h),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(16.0.h),
          ),
          child: AutoSizeText(
            CardSummeryStrings.seeMore.toUpperCase(),
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
