import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import 'package:trip_planner/features/common/export.dart';
import 'package:trip_planner/features/home/widgets/background_painter.dart';
import 'package:trip_planner/features/home/widgets/circuler_button.dart';
import 'package:trip_planner/features/home/widgets/flight_card.dart';
import 'package:trip_planner/features/home/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> bookingMenu = [
    {"icon": HugeIcons.strokeRoundedCar04, "onTap": () {}},
    {"icon": HugeIcons.strokeRoundedPlane, "onTap": () {}},
    {"icon": HugeIcons.strokeRoundedBuilding04, "onTap": () {}},
    {"icon": Iconsax.people, "onTap": () {}},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: BackgroundPainter(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.paddingOf(context).top + 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HugeIcon(
                      icon: HugeIcons.strokeRoundedMenu03,
                      color: AppColor.white),
                  Container(
                    height: 60,
                    width: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: Image.asset(
                      "assets/images/profile.avif",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              spacer20,
              Text(
                "Hello! Tina",
                style: TextStyle(
                    fontFamily: primaryFontFamily,
                    fontSize: 14,
                    color: AppColor.cyan),
              ),
              spacer20,
              Text(
                "LET'S COMPLETED",
                style: TextStyle(
                    fontFamily: primaryFontFamily,
                    fontSize: 28,
                    color: Colors.white),
              ),
              Text(
                "YOUR MISSION",
                style: TextStyle(
                    fontFamily: primaryFontFamily,
                    fontSize: 32,
                    color: Colors.white),
              ),
              spacer20,
              buildSearchFeild(),
              spacer20,
              Text("Booking",
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  )),
              spacer20,
              SizedBox(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = bookingMenu[index];
                      return CircleScaleButton(
                        onTap: data['onTap'],
                        icon: data['icon'],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: bookingMenu.length),
              ),
              spacer20,
              Row(
                children: [
                  Text("Upcoming Flights",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      )),
                  const Spacer(),
                  Text("View All",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                ],
              ),
              spacer20,
              const FlightCard(),
              SizedBox(
                height: MediaQuery.paddingOf(context).bottom + 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
