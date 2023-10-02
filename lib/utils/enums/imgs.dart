import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

enum ImgConstants {
  dateLogo('date_logo'),
  dateDark('date_light'),
  msLogo('ms_logo'),
  msDark('ms_light'),
  smallCarLogo('small_car_logo'),
  smallCarDark('small_car_light'),
  taxi('taxi'),
  titleLogo('title_logo'),
  titleDark('title_light'),
  carLogo('car_logo'),
  layout('back');

  final String path;
  // ignore: sort_constructors_first
  const ImgConstants(this.path);
  String get _svg => 'assets/images/$path.svg';
  String get _png => 'assets/images/$path.png';
  String get _jpg => 'assets/images/$path.jpg';
  String get _jpeg => 'assets/images/$path.jpeg';
  Widget get svgPicture => SvgPicture.asset(
        _svg,
      );
  Widget get svgPictureActive => SvgPicture.asset(
        _svg,
      );
  Widget get svgPictureInactive => SvgPicture.asset(
        _svg,
      );
  Widget pngPicture({double? height, double? width, BoxFit? fit}) =>
      Image.asset(
        _png,
        width: width,
        fit: fit ?? BoxFit.contain,
        height: height,
      );
  Widget get jpgPicture => Image.asset(_jpg);
  Widget get jpegPicture => Image.asset(_jpeg);
}
