import 'package:flutter/material.dart';
import 'package:ms_taxi/components/widgets/plus_btn.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    this.title,
    this.subtitle,
    this.children,
    this.isDetailedChild = false,
  });

  final String? title;
  final String? subtitle;
  final List<Widget>? children;
  final bool isDetailedChild;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: widget.isDetailedChild
            ? const Icon(
                Icons.arrow_right_rounded,
                color: kcButtonSuccessColor,
                size: 36,
              )
            : AddBtn(
                isMinus: isExpanded,
              ),
        title: BoxText.btnTxt(
          widget.title ?? '',
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.theme.colorScheme.onSecondary,
            fontSize: 18,
          ),
        ),
        subtitle: BoxText.btnTxt(
          widget.subtitle ?? '',
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.theme.colorScheme.onSecondary,
            fontSize: 18,
          ),
        ),
        childrenPadding: const PagePadding.onlyLeft(),
        trailing: const SizedBox.shrink(),
        onExpansionChanged: (value) {
          if (widget.children?.isNotEmpty ?? false) {
            setState(() {
              isExpanded = !isExpanded;
            });
          }
        },
        children: widget.children ?? [],
      ),
    );
  }
}
