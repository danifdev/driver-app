import 'package:flutter/material.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';

enum Tariffs {
  animal('7'),
  children('10'),
  products('5'),
  other('30');

  final String title;
  const Tariffs(this.title);
}

class TariffBtn extends StatelessWidget {
  const TariffBtn({
    required this.onChanged,
    this.isSelected = false,
    super.key,
    this.data,
  });

  final Tariffs? data;
  final ValueChanged<Tariffs?> onChanged;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onChanged.call(data);
      },
      child: Text(
        data?.title ?? '',
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: !isSelected
              ? context.theme.colorScheme.onSecondary
              : kcButtonSuccessColor,
        ),
      ),
    );
  }
}
