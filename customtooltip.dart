import 'package:flutter/cupertino.dart';
import 'package:untitled3/main.dart';

class ToolTipCustomShape extends ShapeBorder {

  final bool usePadding;
  final int direction;
  final double p;
  final double radius;
  ToolTipCustomShape({this.usePadding = true,required this.direction,required this.p,required this.radius});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? MyApp.padding : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    if(direction==1){

    rect =
        Rect.fromPoints(rect.topLeft+Offset(-(MyApp.width),0), rect.bottomRight );
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.bottomCenter.dx+p, rect.topCenter.dy)
      ..relativeLineTo(10+MyApp.arrw,-(20+MyApp.arrh))
      ..relativeLineTo(10+MyApp.arrw,(20+MyApp.arrh))
      ..close();}
    else{
      rect =
          Rect.fromPoints(rect.topLeft, rect.bottomRight +Offset(MyApp.width, 0));

      return Path()
        ..addRRect(
            RRect.fromRectAndRadius(rect, Radius.circular(radius)))
        ..moveTo(rect.bottomCenter.dx, rect.bottomCenter.dy)
        ..relativeLineTo(5+MyApp.arrw,(15+MyApp.arrh))
        ..relativeLineTo(5+MyApp.arrw,-(15+MyApp.arrh))


        ..close();
    }
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}