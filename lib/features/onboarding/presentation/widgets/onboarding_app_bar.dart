import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tr("change_language"),
                        style: TextStyles.textStyleNormal16,
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        title: Text(tr("arabic")),
                        onTap: () {
                          Navigator.pop(context);
                          context.setLocale(const Locale('ar'));
                        },
                      ),
                      ListTile(
                        title: Text(tr("english")),
                        onTap: () {
                          Navigator.pop(context);
                          context.setLocale(const Locale('en'));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 9.4.w,
                vertical: 9.6.h,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colorD1d1dB, width: 1.0),
              ),
              child: Text(
                context.locale.languageCode == 'ar'
                    ? tr("arabic")
                    : tr("english"),
                style: TextStyles.textStyleNormal13.copyWith(
                  color: color121217,
                ),
                textScaler: TextScaler.linear(1),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(50, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.center,
            ),
            onPressed: () {
              context.push(loginSc);
            },
            child: Text(
              tr("skip"),
              style: TextStyles.textStyleNormal13.copyWith(color: color121217),
              textScaler: TextScaler.linear(1),
            ),
          ),
        ],
      ),
    );
  }
}
