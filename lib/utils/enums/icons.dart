import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

enum IconConstants {
  sun('sun'),
  moon('moon');

  final String path;
  // ignore: sort_constructors_first
  const IconConstants(this.path);
  String get _svg => 'assets/icons/$path.svg';
  String get _png => 'assets/icons/$path.png';
  String get _jpg => 'assets/icons/$path.jpg';
  Widget svgPicture({
    double? height,
    double? width,
    Color? color,
  }) =>
      SvgPicture.asset(
        _svg,
        width: width,
        height: height,
        color: color,
      );
  Widget get svgPictureActive => SvgPicture.asset(
        _svg,
      );
  Widget get svgPictureInactive => SvgPicture.asset(
        _svg,
      );
  Widget get pngPicture => Image.asset(
        _png,
      );
  Widget get jpgPicture => Image.asset(_jpg);
}
