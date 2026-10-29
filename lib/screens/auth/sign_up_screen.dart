import 'package:flutter/material.dart';

import '../../color_helper.dart';
import '../../routers/app_router.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: .center,
                                mainAxisSize: .min,
                                children: [
                                  Image.asset(
                                    "assets/images/expens_logo.png",
                                    width: 200,
                                  ),

                                  SizedBox(height: 30),

                                  // email textField
                                  TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade300,
                                      filled: true,
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20),

                                  // pass textField
                                  TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade300,
                                      filled: true,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20),

                                  // confirm pass textField
                                  TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade300,
                                      filled: true,
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),


                                  SizedBox(height: 40),

                                  // signUp btn
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: FilledButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, AppRouter.home_screen);
                                      },
                                      style: FilledButton.styleFrom(
                                        backgroundColor: ColorHelper.primaryColor,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadiusGeometry.circular(12),
                                        ),
                                      ),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 50),

                                  // or login options
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      SizedBox(width: 10),

                                      Text(
                                        "Or Sign Up with",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      SizedBox(width: 10),

                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 30),

                                  // options btns
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 30,
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                          BorderRadiusGeometry.circular(8),
                                        ),

                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/logo-facebook.png",
                                            fit: BoxFit.contain,
                                            height: 28,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        width: 55,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                          BorderRadiusGeometry.circular(8),
                                        ),

                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/google-logo.png",
                                            fit: BoxFit.contain,
                                            width: 32,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        width: 55,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                          BorderRadiusGeometry.circular(8),
                                        ),

                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/apple-logo.png",
                                            fit: BoxFit.contain,
                                            width: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),


                            Row(
                              mainAxisSize: .min,
                              mainAxisAlignment: .center,
                              spacing: 5,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(fontSize: 16),
                                ),

                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorHelper.primaryColor,
                                      fontWeight: .w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
