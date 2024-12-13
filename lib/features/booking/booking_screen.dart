import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trip_planner/common/export.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedRadio = 1;
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();

  @override
  void initState() {
    _toController.text = 'New Delhi, IN';
    _fromController.text = "Toronto, CA";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E171B),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.paddingOf(context).top + 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white.withOpacity(0.2)),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Iconsax.arrow_left,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                ),
                Text("Flight Book",
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xFF1D2229),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          fillColor: const WidgetStatePropertyAll(Colors.cyan),
                          activeColor: AppColor.cyan,
                          value: 1,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = 1;
                            });
                          },
                        ),
                        Text("Round Trip",
                            style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white54),
                            )),
                        const Spacer(),
                        Radio(
                          activeColor: AppColor.cyan,
                          fillColor: const WidgetStatePropertyAll(Colors.cyan),
                          value: 2,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = 2;
                            });
                          },
                        ),
                        Text("On Way",
                            style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white54),
                            )),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const HugeIcon(
                              color: Colors.grey,
                              size: 32,
                              icon: HugeIcons.strokeRoundedPlane),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _toController,
                              style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white54),
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "New Delhi, IN",
                                hintStyle: GoogleFonts.raleway(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white54),
                                ),
                                label: Text("From",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppColor.cyan),
                                    )),
                              ),
                            ),
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text("From",
                          // style: GoogleFonts.raleway(
                          //   textStyle: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 12,
                          //       color: AppColor.cyan),
                          // )),
                          // Text("New Delhi, IN",
                          //     style: GoogleFonts.raleway(
                          //       textStyle: const TextStyle(
                          //           fontWeight: FontWeight.w400,
                          //           fontSize: 14,
                          //           color: Colors.white54),
                          //     )),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            19,
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
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              String temp = _toController.text;
                              _toController.text = _fromController.text;
                              _fromController.text = temp;
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const HugeIcon(
                                  icon: HugeIcons.strokeRoundedExchange01,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const HugeIcon(
                              color: Colors.grey,
                              size: 32,
                              icon: HugeIcons.strokeRoundedPlane),
                          const SizedBox(
                            width: 20,
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text("To",
                          //         style: GoogleFonts.raleway(
                          //           textStyle: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 12,
                          //               color: AppColor.cyan),
                          //         )),
                          //     Text("Toronto, CA",
                          //         style: GoogleFonts.raleway(
                          //           textStyle: const TextStyle(
                          //               fontWeight: FontWeight.w400,
                          //               fontSize: 14,
                          //               color: Colors.white54),
                          //         )),
                          //   ],
                          // )
                          Expanded(
                            child: TextFormField(
                              controller: _fromController,
                              style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white54),
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Toronto, CA",
                                hintStyle: GoogleFonts.raleway(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white54),
                                ),
                                label: Text("To",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppColor.cyan),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const HugeIcon(
                              color: Colors.grey,
                              size: 32,
                              icon: HugeIcons.strokeRoundedCalendar03),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("From",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: AppColor.cyan),
                                  )),
                              Text("02-05-2024",
                                  style: GoogleFonts.raleway(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.white54),
                                  )),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("To",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: AppColor.cyan),
                                  )),
                              Text("05-02-2024",
                                  style: GoogleFonts.raleway(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.white54),
                                  )),
                            ],
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: AppColor.cyan,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text("Search Flight",
                            style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //#303439
            Container(
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFF1B2229),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    "assets/images/map_1.png",
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 14),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("1030 PM",
                                      style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white),
                                      )),
                                  Text("DEL",
                                      style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white54),
                                      )),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  HugeIcon(
                                      icon: HugeIcons.strokeRoundedTarget03,
                                      size: 14,
                                      color: AppColor.cyan),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                      8,
                                      (index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6),
                                          child: Container(
                                            height: 2,
                                            width: 4,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  HugeIcon(
                                      icon: HugeIcons.strokeRoundedLocation01,
                                      size: 14,
                                      color: AppColor.cyan),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("1030 PM",
                                      style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white),
                                      )),
                                  Text("XYZ",
                                      style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white54),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("2 hr 20 min",
                                      style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                  Text("1 Stops",
                                      style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.white54),
                                      )),
                                ],
                              ),
                              const Spacer(),
                              Text("\$300",
                                  style: GoogleFonts.raleway(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                        color: Colors.white),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
