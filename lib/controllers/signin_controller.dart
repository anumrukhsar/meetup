import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
final formKey = GlobalKey<FormState>();
  var emailController;
  var passwordController;
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateEmail(String val){
    if(val==null || val.isEmpty)
      return 'Email field required';
    if(!GetUtils.isEmail(val))
      return 'Invalid Email';
  }

String? validatePassword(String val){
  if(val==null || val.isEmpty)
    return 'Password field required';
  if(GetUtils.isLengthLessThan(val,8))
    return 'Password must be 8 characters long';
}

  bool onSubmit(){
    if(formKey.currentState!.validate())
     {
       email = emailController.text.toString();
       password = passwordController.text.toString();
       return true;
     }
    return false;
  }
}