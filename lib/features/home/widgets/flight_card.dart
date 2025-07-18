import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_planner/common/color/app_color.dart';
import 'package:trip_planner/common/constant/app_constant.dart';
import 'package:trip_planner/features/home/widgets/clipper.dart';

class FlightCard extends StatefulWidget {
  const FlightCard({super.key});

  @override
  State<FlightCard> createState() => _FlightCardState();
}

class _FlightCardState extends State<FlightCard> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: SizedBox(
        height: 300,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              // bottom: -100,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.topLeft,
                      tileMode: TileMode.clamp,
                      transform: const GradientRotation(1),
                      colors: [
                        // const Color(0xFF17353A).withOpacity(0.8),
                        // AppColor.cyan.withOpacity(0.3),
                        // AppColor.cyan.withOpacity(0.1),
                        // AppColor.cyan.withOpacity(0.3),
                        // const Color(0xFF17353A).withOpacity(0.3),
                        const Color(0xFF17353A).withOpacity(0.8),
                        const Color(0xFF17353A).withOpacity(0.3),
                        const Color(0xFF17353A).withOpacity(0.8),
                      ],
                    ),
                    color: const Color(0xFF17353A).withOpacity(0.3),
                    border: Border.all(
                        color: const Color(0xFF17353A).withOpacity(0.2),
                        width: 0.5),
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(60)),
                child: const FlightCardUI(),
              ),
            ),
            Positioned(
              bottom: 80,
              left: -10,
              child: Container(
                height: 40,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.cyan.withOpacity(0.3)),
              ),
            ),
            Positioned(
              bottom: 80,
              right: -10,
              child: Container(
                height: 40,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.cyan.withOpacity(0.3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightCardUI extends StatefulWidget {
  const FlightCardUI({super.key});

  @override
  State<FlightCardUI> createState() => _FlightCardUIState();
}

class _FlightCardUIState extends State<FlightCardUI> {
  int dots = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Timer.periodic(
          const Duration(milliseconds: 500),
          (timer) {
            setState(() {
              if (dots <= 6) {
                dots = dots + 1;
              } else {
                dots = 1;
              }
            });
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          spacer40,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NYC",
                      style: GoogleFonts.raleway(
                        height: 0.9,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                            color: Colors.white),
                      )),
                  Text("New York City",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      dots,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Container(
                            height: 2,
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text("2h 35m",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("SOF",
                      style: GoogleFonts.raleway(
                        height: 0.9,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                            color: Colors.white),
                      )),
                  Text("San Fransisco",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey),
                      )),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Daste & Time",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      )),
                  Text("Feb 25, 11:30pm",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey),
                      )),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Flight Number",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      )),
                  Text("ABF7382",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey),
                      )),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              21,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Container(
                    height: 2,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                );
              },
            ),
          ),
          spacer20,
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Opacity(
                    opacity: 0.6,
                    child: Image.asset("assets/icons/logo_light.png")),
              ),
              const Spacer(),
              Text("\$500",
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Colors.white),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
