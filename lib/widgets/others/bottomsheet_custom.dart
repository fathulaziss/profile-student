import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_student/styles/styles.dart';
import 'package:profile_student/utils/app_utils.dart';

class BottomSheetCustom {
  BottomSheetCustom({
    required this.context,
    required this.child,
    this.header,
    this.contentPadding,
    this.buttonBottomPadding,
    this.buttonBottom,
    this.initialChildSize,
    this.resizeToAvoidBottomInset = false,
  });

  final BuildContext context;
  final Widget child;
  final Widget? header;
  final EdgeInsets? contentPadding;
  final EdgeInsets? buttonBottomPadding;
  final Widget? buttonBottom;
  final double? initialChildSize;
  final bool? resizeToAvoidBottomInset;

  void showData() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: AppUtils.dismissKeyboard,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.w),
                topRight: Radius.circular(18.w),
              ),
              color: Colors.white,
            ),
            padding: resizeToAvoidBottomInset == false
                ? EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  )
                : EdgeInsets.zero,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return DraggableScrollableSheet(
                  initialChildSize: initialChildSize ?? 0.90,
                  expand: false,
                  builder: (
                    BuildContext context,
                    ScrollController scrollController,
                  ) {
                    return Flex(
                      direction: Axis.vertical,
                      children: [
                        header ??
                            Container(
                              width: 100.w,
                              height: 4.w,
                              margin: EdgeInsets.only(top: 24.w, bottom: 12.w),
                              decoration: BoxDecoration(
                                borderRadius: Corners.xsBorder,
                                color: const Color(0xFFC4C4C4),
                              ),
                            ),
                        Expanded(
                          child: Padding(
                            padding: contentPadding ??
                                EdgeInsets.symmetric(horizontal: 24.w),
                            child: child,
                          ),
                        ),
                        if (buttonBottom != null)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:
                                  buttonBottomPadding ?? EdgeInsets.all(24.w),
                              child: buttonBottom,
                            ),
                          )
                        else
                          const SizedBox(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
