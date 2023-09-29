import 'package:flutter/material.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';

class RowTile extends StatelessWidget {
  const RowTile({
    required this.title,
    required this.value,
    super.key,
    this.needExpand = false,
    this.valueAlignRight = false,
    this.valueW,
  });

  final String title;
  final String value;
  final bool needExpand;
  final bool valueAlignRight;
  final Widget? valueW;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          needExpand ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: kcSecondaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        8.boxW,
        if (valueW == null) ...[
          if (!needExpand)
            Expanded(
              child: Text(
                value,
                textAlign: valueAlignRight ? TextAlign.right : TextAlign.left,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: kcSecondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            )
          else
            Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                color: kcSecondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
        ] else
          valueW!,
      ],
    );
  }
}
