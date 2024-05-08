import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/extension.dart';
import 'package:food_delivery/common/globs.dart';
import 'package:food_delivery/common/service_call.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';
import 'package:food_delivery/view/login/otp_view.dart';
import 'new_password_view.dart';


class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {

  TextEditingController txtEmail = TextEditingController();
  @override 
    Widget build(BuildContext context) {

      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
const SizedBox(height: 64,),

            Text("Reset Password", style:TextStyle(color: TColor.primaryText, fontSize:30 , fontWeight: FontWeight.w800)),
                                    const SizedBox(height: 15,),

                        Text("Please enter your email to recover your password",textAlign: TextAlign.center, style:TextStyle(color: TColor.secondaryText, fontSize:14, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 60,),

          RoundTextfield(hintText: "Your Email",controller: txtEmail,keyboardType: TextInputType.emailAddress,),
          const SizedBox(height: 30,),


RoundButton(title:"Send", onPressed: () {
  btnSubmit();

})
           ]
          )
      ),
      ),
      );
    }
     //TODO: Action
  void btnSubmit() {
    if (!txtEmail.text.isEmail) {
      mdShowAlert(Globs.appName, MSG.enterEmail, () {});
      return;
    }

   
    endEditing();

    serviceCallForgotRequest({"email": txtEmail.text,  });
  }

  //TODO: ServiceCall

  void serviceCallForgotRequest(Map<String, dynamic> parameter) {
    Globs.showHUD();

    ServiceCall.post(parameter, SVKey.svForgotPasswordRequest,
        withSuccess: (responseObj) async {
      Globs.hideHUD();
      if (responseObj[KKey.status] == "1") {
        
        Navigator.push(context, MaterialPageRoute(builder: (context) => OTPView(email: txtEmail.text) ));

         
      } else {
        mdShowAlert(Globs.appName,
            responseObj[KKey.message] as String? ?? MSG.fail, () {});
      }
    }, failure: (err) async {
      Globs.hideHUD();
      mdShowAlert(Globs.appName, err.toString(), () {});
    });
  }
}
