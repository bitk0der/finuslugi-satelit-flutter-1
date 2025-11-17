import 'package:fin_uslugi/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSmallButton extends StatefulWidget {
  final SvgGenImage? icon;
  final Widget? child;
  final VoidCallback onTap;
  final double? size;
  final double padding;
  final Color? color;
  final Color? iconColor;
  const AppSmallButton(
      {this.icon,
      required this.onTap,
      this.padding = 7,
      this.size,
      this.child,
      super.key,
      this.color,
      this.iconColor});

  @override
  State<AppSmallButton> createState() => _AppSmallButtonState();
}

class _AppSmallButtonState extends State<AppSmallButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: widget.size ?? 38.w,
          height: widget.size ?? 38.w,
          decoration: BoxDecoration(
              color: widget.color ?? Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r)),
          padding: EdgeInsets.all(widget.padding),
          child: widget.child ??
              widget.icon!.svg(
                  colorFilter: widget.iconColor != null
                      ? ColorFilter.mode(widget.iconColor!, BlendMode.srcIn)
                      : null)),
    );
  }
}
