import 'package:flutter/material.dart';
import 'package:physio_line/src/presentation/widget/element_card.dart';
import 'package:physio_line/src/core/constants/app_strings.dart';

import '../../widget/app_card.dart';
import '../../widget/custome_appbar.dart';
import '../../widget/cut_divider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhysioAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // first section row
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 36),
              height: 60,
              width: double.infinity,
              color: const Color(0xFFFFF7ED),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 5,
                    color: const Color(0xFFFB923C),
                  ),
                  const SizedBox(width: 16),
                  const Text('Free Account type'),
                ],
              ),
            ),

            // second section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Hello, Name!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // third section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                // Use IntrinsicHeight to make the Row's height match its tallest child
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // The single orange bar covering the entire column
                    Container(width: 5, color: const Color(0xFFFED7AA)),
                    Expanded(
                      // The content column takes the remaining horizontal space
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 170,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Removed the internal orange bar
                                const SizedBox(width: 8), // Maintain spacing
                                const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    'Physio Line',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Removed the internal orange bar
                                const SizedBox(width: 10), // Maintain spacing
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // row 1
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Filter by category:',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),

                                      // row 2
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFEEDD6),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: DropdownButton<String>(
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFFBD4115),
                                          ),
                                          underline: Container(),
                                          isExpanded: true,
                                          dropdownColor: Colors.white,
                                          focusColor: const Color(0xFFFED7AA),
                                          value: selectedItem,
                                          hint: const Text('All'),
                                          items:
                                              const [
                                                    'All',
                                                    'Fundmental',
                                                    'Acute skill',
                                                    'Muscular Rehab',
                                                  ]
                                                  .map(
                                                    (e) =>
                                                        DropdownMenuItem<
                                                          String
                                                        >(
                                                          value: e,
                                                          child: Text(e),
                                                        ),
                                                  )
                                                  .toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              selectedItem = val;
                                            });
                                          },
                                        ),
                                      ),

                                      // row 3
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 24,
                                        ),
                                        child: CutDivider(title: 'Application'),
                                      ),

                                      Wrap(
                                        spacing:
                                            32.0, // Horizontal spacing between cards
                                        runSpacing:
                                            16.0, // Vertical spacing between rows
                                        alignment: WrapAlignment
                                            .start, // Align cards to the start of the row
                                        children: [
                                          AppCard(
                                            path: Constants.acuteCare,
                                            text: 'Acute Care',
                                            location: '/acute_care',
                                          ),
                                          AppCard(
                                            path: Constants.orthopedics,
                                            text: 'Orthopedic',
                                            location: '/ortho',
                                          ),
                                          AppCard(
                                            path: Constants.mentalHealth,
                                            text: 'Mental Health and Rehab',
                                            location: '/mental',
                                          ),

                                          ElementCard(
                                            iconPath: Constants.exercisePattern,
                                            label: 'Exercise Pattern',
                                            location: '/exercise',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
