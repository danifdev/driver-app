import 'package:flutter/material.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    required this.title,
    super.key,
    this.color,
    this.canPop = true,
  });

  final String title;
  final Color? color;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: canPop
          ? BackButton(
              color: color ?? kcPrimaryColor,
            )
          : null,
      centerTitle: canPop,
      title: BoxText.bodyMed(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: kcSecondaryColor,
        ),
      ),
    );
  }
}
