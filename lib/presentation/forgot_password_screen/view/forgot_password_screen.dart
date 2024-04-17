import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/app_utils.dart';
import 'package:recipe_app/presentation/forgot_password_screen/controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: SizedBox(
                height: size.height * .4,
                width: size.width * 0.9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        'Recipe',
                        style: TextStyle(),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter your registerd email"),
                        ),
                      ),
                      Center(
                        child: MaterialButton(
                          onPressed: () {
                            Provider.of<ForgotPasswordController>(context,listen: false)
                                .onForgot(context, emailController.text.trim());
                            emailController.clear();
                            AppUtils.oneTimeSnackBar(bgColor: Colors.green,
                                "Please check your email and set your Newpassword",
                                context: context);
                          },
                          child: Text("Forgot password"),
                          color: Colors.orange,
                        ),
                      )
                    ]))));
  }
}
