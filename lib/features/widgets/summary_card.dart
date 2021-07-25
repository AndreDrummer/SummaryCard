import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summary/core/constants/strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _totalValue(context),
          SizedBox(height: 22.0.h),
          _optionsList(
            context,
            key: CardSummeryStrings.profitability,
            value: '2,767%',
          ),
          _optionsList(
            context,
            key: CardSummeryStrings.cdi,
            value: '3,45%',
          ),
          _optionsList(
            context,
            key: CardSummeryStrings.gain,
            value: 'R\$ 1833,23',
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

  Widget _totalValue(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 7.0.h,
      ),
      alignment: Alignment.center,
      child: AutoSizeText(
        'R\$ 3.200.876,00',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }

  Widget _optionsList(
    BuildContext context, {
    required String key,
    required String value,
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
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Color(0XFF606377),
                  fontSize: 16.sp,
                ),
          ),
          AutoSizeText(
            value,
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
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.sp,
                ),
          ),
        ),
      ),
    );
  }
}
