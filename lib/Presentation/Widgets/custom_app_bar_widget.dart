import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_event_app_clone/AppUtils/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      toolbarHeight: 0,
      elevation: 0,
    );
  }
}
