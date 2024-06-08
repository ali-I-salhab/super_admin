import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_admin/core/constants/colors.dart';
import 'package:z_time_ago/z_time_ago.dart';

class Orderscard extends StatelessWidget {
  final int ordernum;
  final String contain;
  final String price;
  final String status;
  final String date;
  final String servicetype;
  const Orderscard({
    super.key,
    required this.contain,
    required this.price,
    required this.status,
    required this.date,
    required this.ordernum,
    required this.servicetype,
  });

  @override
  Widget build(BuildContext context) {
    String timeAgo = ZTimeAgo().getTimeAgo(
      date: DateTime.parse(date),
      language: Language.arabic,
    );
    return Container(
      padding: EdgeInsets.all(5),
      height: Get.width / 2,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(17)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("الطلب رقم"), Text(timeAgo)],
          ),
          Row(
            children: [
              Text(
                "محتوى الطلب   :",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                contain,
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "نوع الخدمة   :",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                servicetype,
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "حالة الطلب      :",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                status,
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "سعر الطلب      :",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                price,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
