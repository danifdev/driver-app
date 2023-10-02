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
      backgroundColor: context.theme.colorScheme.background,
      leading: canPop
          ? BackButton(
              color: context.theme.colorScheme.primary,
            )
          : null,
      centerTitle: canPop,
      title: BoxText.bodyMed(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: context.theme.colorScheme.onSecondary,
        ),
      ),
    );
  }
}
