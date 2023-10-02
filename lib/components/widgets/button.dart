import 'package:flutter/material.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/utils/constants/app_cons.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/widget_size.dart';

///
/// [ Box button with separate states]
///
class BoxButton<T> extends StatelessWidget {
  BoxButton({
    required this.text,
    this.isExpanded = false,
    super.key,
    this.busy = false,
    this.textColor,
    this.padding,
    this.disabled = false,
    this.onTap,
    this.isAccepted = false,
    this.bgColor,
  })  : outlined = false,
        underlined = false,
        isSelected = false,
        icon = const SizedBox(),
        isIconic = false,
        data = null,
        onChanged = null,
        isTexted = false;

  BoxButton.outlined({
    required this.text,
    this.isExpanded = false,
    super.key,
    this.textColor,
    this.padding,
    this.onTap,
    this.bgColor,
    this.data,
    this.isSelected = false,
    this.onChanged,
  })  : outlined = true,
        disabled = false,
        isTexted = false,
        isAccepted = false,
        icon = const SizedBox(),
        isIconic = false,
        underlined = false,
        busy = false;

  // const BoxButton.text({
  //   required this.text,
  //   super.key,
  //   this.underlined = false,
  //   this.textColor,
  //   this.padding,
  //   this.onTap,
  // })  : outlined = false,
  //       disabled = false,
  //       icon = const SizedBox(),
  //       isTexted = true,
  //       isIconic = false,
  //       busy = false;
  // const BoxButton.icon({
  //   required this.text,
  //   required this.icon,
  //   super.key,
  //   this.underlined = false,
  //   this.padding,
  //   this.onTap,
  // })  : outlined = false,
  //       disabled = false,
  //       isTexted = true,
  //       isIconic = true,
  //       textColor = null,
  //       busy = false;

  final String text;
  final bool busy;
  final bool disabled;
  final Color? bgColor;
  final VoidCallback? onTap;
  final bool outlined;
  final bool isTexted;
  final bool isExpanded;
  final bool underlined;
  final bool isIconic;
  final Widget icon;
  final Color? textColor;
  final EdgeInsets? padding;
  final bool isAccepted;
  final bool isSelected;
  final T? data;
  final ValueChanged<T?>? onChanged;

  final ValueNotifier<T?> _outlinedTapNotifier = ValueNotifier<T?>(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _outlinedTapNotifier,
      builder: (context, isOutlineTapped, __) {
        return SizedBox(
          width: isExpanded ? double.infinity : null,
          child: ElevatedButton(
            onPressed: () {
              if (outlined) {
                if (isOutlineTapped == null) {
                  _outlinedTapNotifier.value = data;
                  onChanged?.call(data);
                } else {
                  _outlinedTapNotifier.value = null;
                  onChanged?.call(null);
                }
                return;
              }
              onTap?.call();
            },
            style: ElevatedButton.styleFrom(
              padding: padding ?? const PagePadding.generalCardAll(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(WidgetSizes.spacingXs),
                side: outlined
                    ? BorderSide(
                        color: bgColor ?? kcButtonSuccessColor,
                        width: !outlined
                            ? AppConstants.kOne.toDouble()
                            : AppConstants.kTwo.toDouble(),
                      )
                    : BorderSide.none,
              ),
              surfaceTintColor: Colors.white,
              foregroundColor: outlined ? Colors.transparent : null,
              shadowColor: outlined ? Colors.white : null,
              backgroundColor: !outlined || isSelected
                  ? (disabled
                      ? (bgColor?.withOpacity(.4) ??
                          kcButtonSuccessColor.withOpacity(.4))
                      : bgColor ?? kcButtonSuccessColor)
                  : context.theme.colorScheme.background,
            ),
            child: AnimatedCrossFade(
              firstChild: DecoratedBox(
                decoration: underlined
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: kcButtonSuccessColor,
                            width: AppConstants.kOne.toDouble(),
                          ),
                        ),
                      )
                    : const BoxDecoration(),
                child: isAccepted
                    ? Text(
                        String.fromCharCode(0x2713),
                        style: TextStyle(
                          inherit: false,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: Icons.check.fontFamily,
                          color: disabled ? kcWhite.withOpacity(.5) : kcWhite,
                        ),
                      )
                    : BoxText.btnTxt(
                        text,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: textColor != null
                              ? disabled
                                  ? textColor?.withOpacity(.5)
                                  : textColor
                              : outlined && !isSelected
                                  ? (disabled
                                      ? (bgColor?.withOpacity(.5) ??
                                          kcButtonSuccessColor.withOpacity(.5))
                                      : (bgColor ?? kcButtonSuccessColor))
                                  : disabled
                                      ? kcWhite.withOpacity(.5)
                                      : kcWhite,
                        ),
                      ),
              ),
              secondChild: const FittedBox(
                child: Padding(
                  padding: PagePadding.allLow(),
                  child: CircularProgressIndicator(
                    strokeWidth: WidgetSizes.spacingXSS,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              ),
              crossFadeState:
                  !busy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 350),
            ),
          ),
        );
      },
    );
  }
}

///
/// [ Back button]
///
class BoxBackButton extends StatelessWidget {
  const BoxBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const PagePadding.onlyLeftLow(),
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Ink(
          child: const Icon(
            Icons.arrow_back,
            color: kcButtonSuccessColor,
            size: WidgetSizes.spacingL,
          ),
        ),
      ),
    );
  }
}

///
/// []
///
class TitledCheckBoxButton extends StatelessWidget {
  const TitledCheckBoxButton({
    required this.value,
    required this.title,
    super.key,
    this.onChanged,
  });
  final bool value;
  final String title;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(!value),
      child: Container(
        padding: const PagePadding.allLow(),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: WidgetSizes.spacingL,
              width: WidgetSizes.spacingL,
              decoration: BoxDecoration(
                color: !value ? null : kcButtonSuccessColor,
                borderRadius: BorderRadius.circular(WidgetSizes.spacingXSS),
                border: Border.all(
                  color: kcButtonSuccessColor,
                  width: AppConstants.kOne.toDouble(),
                ),
              ),
              child: value
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: WidgetSizes.spacingM,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            WidgetSizes.spacingS.boxW,
            Expanded(
              child: BoxText.caption(
                title,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
