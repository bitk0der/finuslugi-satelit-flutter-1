import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextInput extends StatelessWidget {
  final String? hintText;
  final Function(String)? onSend;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final FocusNode focusNode;

  ChatTextInput({
    super.key,
    this.hintText,
    this.inputType,
    this.inputFormatters,
    this.onSend,
    this.maxLength,
    required this.focusNode,
  });

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
      child: Row(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white.withOpacity(0.1),
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: TextFormField(
                  controller: controller,
                  keyboardType: inputType,
                  focusNode: focusNode,
                  maxLength: maxLength,
                  inputFormatters: inputFormatters,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: hintText,
                    counterText: "",
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Container(
            width: 50.h,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white),
              color: Colors.white.withOpacity(0.1),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
              onPressed: () {
                if (onSend != null) onSend!(controller.value.text);
                FocusScope.of(context).unfocus();
              },
              child: Center(
                child: SvgPicture.asset('assets/icons/plane.svg', width: 24.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
