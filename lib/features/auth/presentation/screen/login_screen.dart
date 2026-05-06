import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/custom_app_bar.dart';
import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/auth/presentation/widgets/remmber_me_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubit/login/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/intl_phone_form_field.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    context.read<LoginCubit>().setTabController(ticker: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          backgroundColor: white,
          resizeToAvoidBottomInset: true,
      appBar: customAppBar(context: context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.height/33,),
            Container(
              alignment: Alignment.center,
              child: customSvg(name: login,height: context.height/10,
              width: context.width/10,fit: BoxFit.cover),
            ),
            SizedBox(height: context.height/30,),
            Center(
              child: Text("أهلا بعودتك",style: TextStyles.textStyleBold34.copyWith(
                color: color121217
              ),textScaler: TextScaler.linear(1),),
            ),
            SizedBox(height: context.height/55,),
            Center(
              child: Text("سجل الدخول لحسابك بإستخدام البريد الإلكتروني او رقم الهاتف",style: TextStyles.textStyleNormal12.copyWith(
                  color: color6C6C89
              ),textScaler: TextScaler.linear(1),),
            ),
            SizedBox(height: context.height/30,),
            BlocBuilder<LoginCubit,LoginState>(builder: (context,state)=>
                Container(
                  margin: EdgeInsets.symmetric(horizontal: context.width/30),
                  width: double.infinity,
                  child: TabBar(
                      controller: context.read<LoginCubit>().tabController,
                      indicatorColor: primaryDark,
                      dividerColor: color8A8AA3.withOpacity(.1),
                      textScaler: TextScaler.linear(1),
                      labelPadding: EdgeInsets.symmetric(horizontal: context.width/80),
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,

                      isScrollable: false,
                      onTap: (int val){
                        context.read<LoginCubit>().updateTabState(val: val);

                      },
                      tabs: [
                        Tab(child: Text(tr("mail"),
                          style: TextStyles.textStyleNormal14.copyWith(
                            color: context.read<LoginCubit>().ind == 0 ?
                            primaryDark :
                            color6C6C89
                          ),
                          textScaler: TextScaler.linear(1),),),
                        Tab(child: Text(tr("phone"),
                          style: TextStyles.textStyleNormal14.copyWith(
                              color: context.read<LoginCubit>().ind == 1 ?
                              primaryDark :color6C6C89
                          ),
                          textScaler: TextScaler.linear(1),),),

                      ]),
                )),
            SizedBox(height: context.height/27,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: context.width/20),
              height: context.height/6.3,
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: context.read<LoginCubit>().tabController,
                  children: [
                    SizedBox(
                      child: CustomTextField(controller: mailController,
                        hintTxt: ""
                        , svgIcon: mail,obscure: false,
                        textInputType: TextInputType.text,
                        validator: (val){
                          if(mailController.text.isEmpty&& phoneController.text.isEmpty) {
                            return tr("field_required");
                          }else {
                            return null;
                          }
                        }, title: tr("mail"),),
                    ),
                    SizedBox(
                      child: IntlPhoneFormField(
                        countryCodeController: countryCodeController,
                        controller: phoneController, hintTxt: "+20 10 1234567"
                        ,type: "phone"
                        , obscure: false,
                        validator: (val){
                          if(mailController.text.isEmpty && phoneController.text.isEmpty) {
                            return tr("field_required");
                          }else {
                            return null;
                          }
                        },
        
                        textInputType: TextInputType.number, title: tr("phone"),),
                    ),
                  ]),),

            Container(
              margin: EdgeInsets.symmetric(horizontal: context.width/20),
              child: CustomTextField(controller: passwordController,
                hintTxt: ""
                , svgIcon: knock,obscure: false,
                textInputType: TextInputType.text,
                validator: (val){
                  if(passwordController.text.isEmpty) {
                    return tr("field_required");
                  }else {
                    return null;
                  }
                }, title: tr("password"),),
            ),
            SizedBox(height: context.height/45,),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: context.width/40),
              child: Row(
                children: [
                  Expanded(child: RemmeberMeWidget()),
                  InkWell(onTap: (){},
                  child: Text("نسيت كلمة المرور؟",
                  style: TextStyles.textStyleNormal12.copyWith(
                    color: color8A8AA3
                  ),textScaler: TextScaler.linear(1),),)
                ],
              ),
            ),
            SizedBox(height: context.height/25,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: context.width/15),
              child: CustomButton(btnTitle: tr("تسجيل دخـول")
                  , onPressed: (){
                context.push(bottomBarSc);
                  }),
            ),
            SizedBox(height: context.height/10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("ليس لديك حساب؟ ",
                  style: TextStyles.textStyleNormal12.copyWith(
                      color: color8A8AA3
                  ),textScaler: TextScaler.linear(1),),
                SizedBox(height: context.width/30,),
                InkWell(
                  onTap: (){
                    context.push(registerSc);
                  },
                  child: Text("انشاء حساب",
                    style: TextStyles.textStyleNormal12.copyWith(
                        color: primaryDark,
                      decoration: TextDecoration.underline,
                      decorationColor: primaryDark,
                      fontWeight: FontWeight.w600
                    ),textScaler: TextScaler.linear(1),),
                )
              ],),
            SizedBox(height: context.height/20,)
          ],
        ),
      ),
    ));
  }
}