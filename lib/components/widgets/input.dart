import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/index.dart';

class BoxInputField extends StatelessWidget {
  BoxInputField({
    required this.controller,
    required this.label,
    super.key,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
    this.phone = false,
    this.validator,
    this.inputFormatters,
    this.isError = false,
  });
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final bool phone;
  final FormFieldValidator<String?>? validator;
  final List<TextInputFormatter>? inputFormatters;

  final String label;
  final void Function()? trailingTapped;

  final bool isError;

  final ValueNotifier<bool> _showPassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoxText.bodyMed(
          label,
          color: isError ? Colors.red : context.theme.colorScheme.onSecondary,
        ),
        WidgetSizes.spacingXSs.boxH,
        ValueListenableBuilder(
          valueListenable: _showPassword,
          builder: (context, show, __) {
            return Theme(
              data: ThemeData(primaryColor: kcSecondaryColor),
              child: TextFormField(
                validator: validator,
                controller: controller,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onSecondary,
                ),
                obscureText: password && (!show),
                cursorColor: kcSecondaryColor,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: context.textTheme.bodyLarge?.copyWith(
                    color:
                        context.theme.colorScheme.onSecondary.withOpacity(.5),
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const PagePadding.generalCardAll(),
                  prefix: leading,
                  suffixIcon: password
                      ? GestureDetector(
                          onTap: () {
                            _showPassword.value = !_showPassword.value;
                          },
                          child: trailing ??
                              Icon(
                                show ? Icons.visibility_off : Icons.visibility,
                                color: context.theme.colorScheme.onSecondary,
                              ),
                        )
                      : null,
                  border: isError ? errorBorder(context) : border(context),
                  errorBorder: isError ? errorBorder(context) : border(context),
                  focusedBorder:
                      isError ? errorBorder(context) : border(context),
                  disabledBorder:
                      isError ? errorBorder(context) : border(context),
                  enabledBorder:
                      isError ? errorBorder(context) : border(context),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  InputBorder? border(BuildContext context) =>
      context.theme.inputDecorationTheme.border;
  InputBorder? errorBorder(BuildContext context) =>
      context.theme.inputDecorationTheme.errorBorder;

  // OutlineInputBorder _border(BuildContext context) {
  //   return context.theme.inputDecorationTheme.copyWith(
  //     borderSide:  BorderSide(
  //       color: context.theme.colorScheme.background,
  //       width: WidgetSizes.spacingXSS,
  //     ),
  //   );
  // }

  // OutlineInputBorder _error() {
  //   return context.theme.inputDecorationTheme.copyWith(
  //     borderSide: const BorderSide(
  //       color: Colors.red,
  //       width: WidgetSizes.spacingXSS,
  //     ),
  //   );
  // }
}
