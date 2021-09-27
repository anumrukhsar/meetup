import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetup/controllers/signin_controller.dart';
import 'package:meetup/screens/eventlist.dart';
import 'package:meetup/widgets/customtextinputfiel.dart';
import 'package:get/get.dart';
import 'package:meetup/widgets/logo.dart';

class SignIn extends StatelessWidget {
 final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: signInController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              Text(
                'Welcome to Events meetup app',
                style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(fontSize: 16, color: Colors.teal)),
              ),
              CustomTextInputField(
                tag: 1,
                controller: signInController.emailController,
                hint: 'Email',
                inputAction: TextInputAction.next,
                validationErr:signInController.validateEmail,
              ),
              CustomTextInputField(
                tag: 2,
                controller: signInController.passwordController,
                hint: 'Password',
                inputAction: TextInputAction.done,
                validationErr: signInController.validatePassword,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () => login(),
                    child: Text(
                      'Login',
                      style: GoogleFonts.montserrat(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
      if(signInController.onSubmit()) {
        Get.snackbar('Login', 'Welcome ${signInController.email}');
        Get.offAll(EventList());
      }
  }
}
