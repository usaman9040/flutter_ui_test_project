import 'package:ava_finance/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconData,
    this.onPressed,
  });
  final String title;
  final IconData? iconData;
  final Function()? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.primaryColor,
      leading: (iconData == null)
          ? const SizedBox()
          : IconButton(
              icon: Icon(iconData),
              onPressed: () => onPressed?.call(),
            ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(size: 20.h, color: Colors.white),
    );
  }
}
