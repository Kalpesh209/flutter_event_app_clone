import 'package:flutter/material.dart';
import 'package:flutter_event_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_event_app_clone/Business/Models/Event/event_model.dart';
import 'package:flutter_event_app_clone/Presentation/Widgets/circle_button_widget.dart.dart';
import 'package:flutter_event_app_clone/Presentation/Widgets/custom_app_bar_widget.dart';
import 'package:flutter_event_app_clone/Presentation/Widgets/custom_clipper_ticket_widget.dart.dart';
import 'package:flutter_event_app_clone/Presentation/Widgets/custom_dashed_line_widget.dart.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> eventData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final EventModel eventModel = EventModel.fromJson(eventData);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(0, 0), child: CustomAppBarWidget()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              _buildAppBar(context),
              const SizedBox(height: 30),
              ClipPath(
                clipper: CustomClipperTicketWidget(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: Image.network(
                              eventModel.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLightColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventModel.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            CustomPaint(
                              painter: CustomDashedLinePainterWidget(),
                              child: const SizedBox(
                                height: 1,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _textDescription("Name", "Muhammad Ridhoi"),
                                _textDescription("Date", "16 : 00 PM"),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _textDescription(
                                    "Date", "${eventModel.date} 2022"),
                                _textDescription("Seat", "UNOJI B12"),
                              ],
                            ),
                            const SizedBox(height: 32),
                            CustomPaint(
                              painter: CustomDashedLinePainterWidget(),
                              child: const SizedBox(
                                height: 1,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/barcode.png",
                                height: 70,
                                width: MediaQuery.of(context).size.width * 0.5,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textDescription(String title, String value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                const TextStyle(fontSize: 12, color: AppColors.greyTextColor),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ],
      );

  Widget _buildAppBar(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButtonWidget(
            icon: 'assets/images/back.png',
            onTap: () => Navigator.pop(context),
          ),
          const Text(
            "My Ticket",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 42),
        ],
      );
}
