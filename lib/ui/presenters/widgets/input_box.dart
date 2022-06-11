import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget InputBox({
  required BuildContext context,
  required String title,
  required String hintText,
  required String initialValue,
  // required TextEditingController controller,
  required Function(String) onChange,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          right: 16.w,
          bottom: 6.h,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.overline!,
        ),
      ),
      Container(
        height: 130.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 9.h,
        ),
        child: Form(
          child: TextFormField(
            textDirection: TextDirection.rtl,
            // controller: controller,
            initialValue: initialValue,
            scrollPadding: EdgeInsets.symmetric(vertical: 4.h),
            maxLines: 20,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  decoration: TextDecoration.none,
                ),
            textInputAction: TextInputAction.done,
            onChanged: (value) => onChange(value),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black12),
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    ],
  );
}
