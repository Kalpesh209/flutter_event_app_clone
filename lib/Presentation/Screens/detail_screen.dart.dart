import 'package:flutter/material.dart';
import 'package:flutter_event_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_event_app_clone/AppUtils/app_routes.dart';
import 'package:flutter_event_app_clone/Business/Models/Event/event_model.dart';
import 'package:flutter_event_app_clone/Presentation/Widgets/circle_button_widget.dart.dart';
import 'package:flutter_event_app_clone/Presentation/Widgets/custom_app_bar_widget.dart';
import 'package:flutter_event_app_clone/Presentation/Widgets/stack_participant_widget.dart.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> eventData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final EventModel eventModel = EventModel.fromJson(eventData);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 0),
        child: CustomAppBarWidget(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Column(
                  children: [
                    _buildAppBar(context),
                    const SizedBox(height: 24),
                    _buildCardImage(eventModel),
                    const SizedBox(height: 16),
                    _buildDescription(eventModel),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomBar(context, eventModel),
          )
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, EventModel eventModel) =>
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
          decoration: const BoxDecoration(color: AppColors.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style:
                        TextStyle(fontSize: 12, color: AppColors.greyTextColor),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        "\$100",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        "/Person",
                        style: TextStyle(
                            fontSize: 12, color: AppColors.greyTextColor),
                      )
                    ],
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.ticketScreen,
                  arguments: eventModel.toJson(),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    maximumSize: const Size(200, 150)),
                child: const Text(
                  "Get a Ticket",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      );

  Widget _buildCardImage(EventModel eventModel) => Stack(
        children: [
          Container(
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16)),
          ),
          Container(
            width: double.infinity,
            height: 310,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  eventModel.image,
                ),
              ),
            ),
          ),
          Positioned(
            right: 22,
            top: 22,
            child: Container(
              height: 65,
              width: 48,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    eventModel.date.split(" ")[0],
                  ),
                  Text(
                    eventModel.date.split(" ")[1],
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )
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
            "Detail",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      );

  _buildDescription(EventModel eventModel) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventModel.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const SizedBox(width: 4),
                        Text(
                          eventModel.location,
                          style:
                              const TextStyle(color: AppColors.greyTextColor),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 65,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "\$100",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const StackParticipantWidget(
              fontSize: 14,
              width: 30,
              height: 30,
              positionText: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: eventModel.description,
                style: const TextStyle(
                  color: AppColors.greyTextColor,
                  fontSize: 12,
                  height: 1.75,
                ),
                children: const [
                  TextSpan(
                    text: "Read More...",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      );
}
