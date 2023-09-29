import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:ms_taxi/utils/constants/app_cons.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/index.dart';

class AddBtn extends StatelessWidget {
  const AddBtn({super.key, this.isMinus = false});

  final bool isMinus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kcPrimaryColor,
        border: Border.all(
          width: WidgetSizes.spacingXxs,
          color: kcPrimarySecondary,
        ),
      ),
      padding: isMinus
          ? const EdgeInsets.symmetric(horizontal: 8.5)
          : const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Text(
          String.fromCharCode(isMinus ? 45 : 43),
          style: TextStyle(
            inherit: false,
            fontSize: isMinus ? 28 : 24,
            fontWeight: FontWeight.bold,
            fontFamily:
                isMinus ? Icons.remove.fontFamily : Icons.add.fontFamily,
          ),
        ),
      ),
    );
  }
}
