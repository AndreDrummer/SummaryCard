import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      height: Get.height / 2,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0.h),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Seu Resumo'),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 16.0.h),
          Text('Valor investido'),
          Text('R\$ 3.200.876,00'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rentabilidades/mês'),
              Text('2,767%'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CDI'),
              Text('3,45%'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ganho/mês'),
              Text('R\$ 1833,23'),
            ],
          ),
          Divider(),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(4.0.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(16.0.h),
                ),
                child: Text(
                  'VER MAIS',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
