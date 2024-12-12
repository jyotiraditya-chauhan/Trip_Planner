import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trip_planner/common/color/app_color.dart';

Widget buildSearchFeild() {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: AppColor.cyan.withOpacity(0.1),
      borderRadius: BorderRadius.circular(60),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: AppColor.cyan),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: TextFormField(
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search Hotel, tickets, etc...",
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          const HugeIcon(
              icon: HugeIcons.strokeRoundedMic01, color: Colors.grey),
        ],
      ),
    ),
  );
}
