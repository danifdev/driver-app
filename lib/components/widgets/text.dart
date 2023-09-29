import 'package:flutter/material.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';

enum TextStyleType {
  body,
  bodyMed,
  headline,
  caption,
  bigTitle,
  btnTxt,
}

class BoxText extends StatelessWidget {
  const BoxText.headline(
    this.txt, {
    super.key,
    this.style,
    this.maxLine,
    this.textAlign = TextAlign.start,
    this.textStyleTpe = TextStyleType.headline,
    this.color,
  });

  const BoxText.body(
    this.txt, {
    super.key,
    this.maxLine,
    this.style,
    this.textAlign = TextAlign.start,
    this.textStyleTpe = TextStyleType.body,
    this.color,
  });
  const BoxText.bodyMed(
    this.txt, {
    super.key,
    this.maxLine,
    this.style,
    this.textAlign = TextAlign.start,
    this.textStyleTpe = TextStyleType.bodyMed,
    this.color,
  });

  const BoxText.caption(
    this.txt, {
    this.maxLine,
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
    this.textStyleTpe = TextStyleType.caption,
    this.color,
  });
  const BoxText.bigTitle(
    this.txt, {
    super.key,
    this.style,
    this.textAlign = TextAlign.center,
    this.textStyleTpe = TextStyleType.bigTitle,
    this.maxLine,
    this.color,
  });
  const BoxText.btnTxt(
    this.txt, {
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
    this.maxLine,
    this.textStyleTpe = TextStyleType.btnTxt,
    this.color,
  });

  final String txt;
  final TextStyle? style;
  final Color? color;
  final TextAlign textAlign;
  final TextStyleType textStyleTpe;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    switch (textStyleTpe) {
      case TextStyleType.body:
        return Text(
          txt,
          textAlign: textAlign,
          style: style ?? context.textTheme.bodyMedium,
          maxLines: maxLine,
          overflow: maxLine != null ? TextOverflow.ellipsis : null,
        );
      case TextStyleType.bodyMed:
        return Text(
          txt,
          textAlign: textAlign,
          style: style ??
              context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: color ?? kcSecondaryColor,
              ),
          maxLines: maxLine,
          overflow: maxLine != null ? TextOverflow.ellipsis : null,
        );
      case TextStyleType.btnTxt:
        return Text(
          txt,
          textAlign: textAlign,
          style: style ??
              context.textTheme.labelLarge
                  ?.copyWith(color: kcWhite, fontWeight: FontWeight.bold),
          maxLines: maxLine,
          overflow: maxLine != null ? TextOverflow.ellipsis : null,
        );
      case TextStyleType.headline:
        return Text(
          txt,
          textAlign: textAlign,
          style: style ?? context.textTheme.displayLarge,
          maxLines: maxLine,
          overflow: maxLine != null ? TextOverflow.ellipsis : null,
        );
      case TextStyleType.caption:
        return Text(
          txt,
          textAlign: textAlign,
          style: style ?? context.textTheme.bodySmall,
          maxLines: maxLine,
          overflow: maxLine != null ? TextOverflow.ellipsis : null,
        );
      case TextStyleType.bigTitle:
        return Text(
          txt,
          textAlign: textAlign,
          style: style ??
              context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: kcSecondaryColor,
              ),
          maxLines: maxLine,
          overflow: maxLine != null ? TextOverflow.ellipsis : null,
        );
      // ignore: no_default_cases
      default:
        return const SizedBox();
    }
  }
}
