// import 'package:flutter/material.dart';

// class LikeBtn extends StatefulWidget {
//   const LikeBtn({
//     super.key,
//     this.onFavoritesClick,
//     required this.isLiked,
//     required this.isLiking,
//     required this.id,
//     required this.favorite,
//   });
//   final Function(int id)? onFavoritesClick;
//   final bool isLiked;
//   final bool favorite;
//   final bool isLiking;
//   final int id;

//   @override
//   State<LikeBtn> createState() => _LikeBtnState();
// }

// class _LikeBtnState extends State<LikeBtn> with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> _sizeAnimation;

//   bool isFav = false;

//   @override
//   void initState() {
//     controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
//       TweenSequenceItem(
//         tween: Tween(begin: 26.h, end: 28.h),
//         weight: 26.h,
//       ),
//       TweenSequenceItem(
//         tween: Tween(begin: 28.h, end: 26.h),
//         weight: 26.h,
//       ),
//     ]).animate(controller);

//     controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() {
//           isFav = true;
//         });
//       }
//       if (status == AnimationStatus.dismissed) {
//         setState(() {
//           isFav = false;
//         });
//       }
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, _) {
//         return GestureDetector(
//           onTap: () {
//             isFav ? controller.reverse() : controller.forward();
//             widget.onFavoritesClick?.call(widget.id);
//           },
//           child: widget.isLiked
//               ? IconConstants.liked.svgPicture(
//                   height: _sizeAnimation.value,
//                   width: _sizeAnimation.value,
//                 )
//               : widget.isLiking
//                   ? IconConstants.liking.svgPicture(
//                       height: _sizeAnimation.value,
//                       width: _sizeAnimation.value,
//                     )
//                   : IconConstants.fav.svgPicture(
//                       height: _sizeAnimation.value,
//                       width: _sizeAnimation.value,
//                       color: ColorConstants.another.lightGreyColor,
//                     ),
//         );
//       },
//     );
//   }
// }
