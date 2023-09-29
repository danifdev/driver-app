// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:juwan/components/widgets/button.dart';
// import 'package:juwan/components/widgets/text.dart';
// import 'package:juwan/l10n/l10n.dart';
// import 'package:juwan/utils/globals/enums.dart';
// import 'package:juwan/utils/settings/theme.dart';

// class NoNetworkWidget extends StatelessWidget {
//   const NoNetworkWidget({super.key, required this.onTryAgain});

//   final VoidCallback onTryAgain;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(45).h,
//       alignment: Alignment.center,
//       child: Container(
//         padding: AppPaddings.med,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ImgConstants.noNetwork.pngPicture(height: 180.h),
//             AppSpacings.verMed,
//             Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: AppPaddings.horMed,
//                     child: BoxText.btnTxt(
//                       context.l10.otherException,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             AppSpacings.verMed,
//             BoxButton(
//               text: context.l10.tryAgain,
//               onTap: onTryAgain.call,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
