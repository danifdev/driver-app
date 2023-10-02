import 'package:flutter/material.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';

class CounterMoney extends StatelessWidget {
  const CounterMoney({super.key, this.money});

  final double? money;

  @override
  Widget build(BuildContext context) {
    final a = money?.toInt() ?? 0;
    final b = (((money ?? 0) - a) * 100).toStringAsFixed(0);

    return Container(
      padding: const PagePadding.horizontalLowSymmetric(),
      child: RichText(
        text: TextSpan(
          text: a.toString(),
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.theme.colorScheme.onSecondary,
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '.$b',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 52,
                color: context.theme.colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: ' TMT',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
