import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/custom_app_bar.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/core/widgets/custom_text_field.dart';
import 'package:drug_flow/features/auth/presentation/widgets/address_text_field.dart';
import 'package:drug_flow/features/auth/presentation/widgets/locatoin_drop_down_field.dart';
import 'package:drug_flow/features/auth/presentation/widgets/terms_conditions_widget.dart';
import 'package:drug_flow/features/auth/presentation/widgets/upload_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/styles.dart';
import '../widgets/intl_phone_form_field.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  final TextEditingController mailController = TextEditingController();
  final TextEditingController pharmacyController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();
  final TextEditingController phone3Controller = TextEditingController();

  final TextEditingController countryCodeController = TextEditingController();

  final TextEditingController countryCode2Controller = TextEditingController();

  final TextEditingController countryCode3Controller = TextEditingController();


  final TextEditingController addressController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
    Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: customAppBar(context: context),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: context.width/20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.height/30,),
               Text("أهلا بك في درج فلو",style: TextStyles.textStyleBold24.copyWith(
                    color: color121217
                ),textScaler: TextScaler.linear(1),),
              SizedBox(height: context.height/30,),
              Text("يرجي ادخال البيانات الخاصه بالصيدلية لإنشاء الحساب",
                style: TextStyles.textStyleNormal12.copyWith(
                  color: color6C6C89
              ),textScaler: TextScaler.linear(1),),
              SizedBox(height: context.height/30,),
              UploadItemWidget(img: camera, title: 'صورة الصيدلية',
                  description: 'برجاء رفع صورة للصيدلية, على ان لا يزيد حجم الصورة عن ٥ ميجا'),
              SizedBox(height: context.height/30,),
              UploadItemWidget(img: camera, title: 'صورة الرخصة',
                  description: 'برجاء رفع صورة الرخصة, على ان لا يزيد حجم الصورة عن ٥ ميجا'),
              SizedBox(height: context.height/30,),
              CustomTextField(controller: pharmacyController, obscure: false, hintTxt: 'اسم الصيدلية',
                  svgIcon: pharmacy, textInputType: TextInputType.text,
                  title: tr("اسم الصيدلية")),
              SizedBox(height: context.height/30,),
              CustomTextField(controller: mailController, obscure: false, hintTxt: 'example@mail.com',
                  svgIcon: mail, textInputType: TextInputType.text, title: "البريد الاكتروني"),
              SizedBox(height: context.height/30,),
              SizedBox(
                child: IntlPhoneFormField(
                  countryCodeController: countryCodeController,
                  controller: phoneController, hintTxt: "+20 10 1234567"
                  ,type: "phone"
                  , obscure: false,
                  validator: (val){
                  },

                  textInputType: TextInputType.number, title: tr("رقم الهاتف"),),
              ),
              SizedBox(height: context.height/40,),
              SizedBox(
                child: IntlPhoneFormField(
                  countryCodeController: countryCode2Controller,
                  controller: phone2Controller, hintTxt: "+20 10 1234567"
                  ,type: "phone"
                  , obscure: false,
                  validator: (val){
                    },

                  textInputType: TextInputType.number, title: tr("رقم هاتف اخر"),),
              ),
              SizedBox(height: context.height/40,),
              SizedBox(
                child: IntlPhoneFormField(
                  countryCodeController: countryCode3Controller,
                  controller: phone3Controller, hintTxt: "+20 10 1234567"
                  ,type: "phone"
                  , obscure: false,
                  validator: (val){

                  },

                  textInputType: TextInputType.number, title: tr("رقم ارضي للصيدلية"),),
              ),
              SizedBox(height: context.height/50,),
              LocationDropDownFormField(hintText: 'حدد المحافظة', title: 'المحافظة',
                  dropDownId: 1, type:''),
              SizedBox(height: context.height/35,),
              LocationDropDownFormField(hintText: 'حدد المدينة', title: 'المدينة',
                  dropDownId: 1, type:''),
              SizedBox(height: context.height/35,),
              LocationDropDownFormField(hintText: 'حدد المنطقة', title: 'المنطقة',
                  dropDownId: 1, type:''),
              SizedBox(height: context.height/30,),
              AddressTextField(controller: addressController, obscure: false,
                  hintTxt: 'الشارع, رقم المبنى الخ....',
                  maxLines: 5,
                  type: 'address',
                  textInputType: TextInputType.text, title: "العنوان التفصيلي",
                svgIcon: '',),
              SizedBox(height: context.height/30,),
              CustomTextField(controller: passwordController, obscure: false, hintTxt: '*******',
                  svgIcon: knock, textInputType: TextInputType.text, title: "كملة المرور"),
              SizedBox(height: context.height/25,),
              CustomTextField(controller: confirmPasswordController, obscure: false, hintTxt: '*******',
                  svgIcon: knock, textInputType: TextInputType.text, title: "تأكيد كملة المرور"),
              SizedBox(height: context.height/55,),
              TermsConditionsWidget(),
              SizedBox(height: context.height/20,),
              Container(
                width: double.infinity,

                  margin: EdgeInsets.symmetric(horizontal: context.width/20),
                  child: CustomButton(btnTitle: 'إنشاء حساب', onPressed: (){})),
              SizedBox(height: context.height/18,)


            ],
          ),
        ),
      ),
    ));
  }
}