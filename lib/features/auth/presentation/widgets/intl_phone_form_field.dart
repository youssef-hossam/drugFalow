import 'package:drug_flow/core/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/styles.dart';
import '../../../../core/utils/helper.dart';

import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/svg_handler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntlPhoneFormField extends StatefulWidget{
  final TextEditingController? controller;
  final TextEditingController? countryCodeController;
  final bool? obscure;
  final bool? visible;
  final String? type;
  final Function()? onTap;
  final String? hintTxt;
  int? maxLines;
  final  Function(PhoneNumber?)? validator;
  final TextInputType? textInputType;
  final String? title;
  bool? enabled;
  bool? valid;


  IntlPhoneFormField({this.controller, this.obscure, this.visible, this.type,
    this.onTap,  this.hintTxt, this.maxLines, this.validator,
    this.textInputType, this.title, this.enabled,this.countryCodeController,this.valid});

  @override
  State<IntlPhoneFormField> createState() => _IntlPhoneFormField();
}

class _IntlPhoneFormField extends State<IntlPhoneFormField> {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.title!,style: TextStyles.textStyleNormal12.copyWith(

            color: color121217
        ),textScaler: TextScaler.linear(1),),
        SizedBox(height: 6.8.h,),
        MediaQuery(data: MediaQueryData(textScaler: TextScaler.linear(1)),
          child: IntlPhoneField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            obscureText: widget.obscure!,
            pickerDialogStyle:

            PickerDialogStyle(
              backgroundColor: white,
              countryCodeStyle: TextStyles.textStyleNormal14.copyWith(color: color121217,),
              countryNameStyle: TextStyles.textStyleNormal14.copyWith(color: color121217,),

            ),
            dropdownTextStyle: TextStyles.textStyleNormal14.copyWith(color: color121217,),
            languageCode: "en",
            enabled: true,
            validator: (phoneNumber) {
              if (phoneNumber == null || phoneNumber.number.isEmpty) {

                return tr("invalid_phone");
              }

              try {
                if (!phoneNumber.isValidNumber()) {
                  return tr("invalid_phone");
                }
              } catch (e) {
                return tr("invalid_phone");
              }

              return null;
            },
            onChanged: (val){
              widget.controller!.text = val.number;
              widget.countryCodeController!.text = val.countryCode;
            },
            onSubmitted: (val){
              //   widget.controller!.text = val;
            },
            onCountryChanged: (val){
            },

            initialCountryCode: "EG",
            keyboardType: TextInputType.number,
            style: TextStyles.textStyleNormal14.copyWith(color: color121217,),
            decoration: InputDecoration(
              fillColor: colorF8FAFC,
              hint: Text(widget.hintTxt!,style: TextStyles.textStyleNormal16
                  .copyWith(color: color818984,)
                ,textScaler: TextScaler.linear(1)
                ,softWrap: true,),



              filled: true,
              errorStyle: TextStyles.textStyleNormal10.copyWith(color: Colors.red,
                  ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
              errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: colorE8e8e8,width: 1)
              ),

            ),
          ),
        ),
      ],
    );
  }
}