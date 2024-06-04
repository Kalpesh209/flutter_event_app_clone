import 'package:flutter/material.dart';
import 'package:flutter_event_app_clone/AppUtils/app_colors.dart';

class CircleButtonWidget extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const CircleButtonWidget({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.primaryLightColor,
          shape: BoxShape.circle,
        ),
        child: Image.asset(icon, width: 18),
      ),
    );
  }
}
