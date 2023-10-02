import 'package:flutter/material.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';

class DetailMoney extends StatelessWidget {
  const DetailMoney({required this.money, super.key});

  final double money;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: money.toString(),
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.theme.colorScheme.onSecondary,
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: ' TMT',
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              color: context.theme.colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
