import 'package:fin_uslugi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  final double bubbleRadius;
  final bool isSender;
  final String text;
  final Widget? child;
  final BoxConstraints? constraints;

  const ChatBubble({
    super.key,
    this.text = "",
    this.child,
    this.bubbleRadius = 100,
    this.isSender = true,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        isSender
            ? const Expanded(child: SizedBox(width: 5))
            : SizedBox(width: 20.w),
        ConstrainedBox(
          constraints: constraints ??
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: isSender ? 10 : 0),
              decoration: BoxDecoration(
                color: child != null
                    ? Colors.transparent
                    : isSender
                        ? ColorStyles.greenColor3
                        : ColorStyles.assistantChatBubbleColor,
                borderRadius: child == null
                    ? BorderRadius.circular(!isSender ? 12 : bubbleRadius)
                    : null,
              ),
              child: Stack(
                children: [
                  if (child != null) child!,
                  if (child == null)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          height: 19.5 / 16.sp,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  const SizedBox(width: 1),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
