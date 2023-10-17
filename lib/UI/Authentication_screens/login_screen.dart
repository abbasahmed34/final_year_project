import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Firebase_services/Authentication_services/services.dart';
import '../../Utils/Routes/routes_names.dart';
import '../../Utils/utils.dart';
import '../../resources/components/app_colors.dart';
import '../../resources/components/rounded_button.dart';
import '../../view_model/provider_auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  FirebaseAuthenticationServices firebaseAuthenticationServices =
  FirebaseAuthenticationServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<ProviderService>(builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height*0.34,
                      child: const Image(
                        image: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Login to a HomeChef FoodLink",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: AppColors.blackColor),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const Text(
                  "using your HomeChef account",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height*0.05,
                      ),
                      TextFormField(
                        focusNode: emailFocusNode,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.alternate_email_outlined),
                          label: Text("Email"),
                        ),
                        onFieldSubmitted: (value) {
                          Utils.onFieldFocus(
                              context, emailFocusNode, passwordFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@')) {
                            return "Enter a valid Email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height*0.02,
                      ),
                      ValueListenableBuilder(
                        valueListenable: _obscurePassword,
                        builder: (context, value, child) {
                          return TextFormField(
                            focusNode: passwordFocusNode,
                            controller: passwordController,
                            obscureText: _obscurePassword.value,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock_open_rounded),
                              suffixIcon: InkWell(
                                onTap: () {
                                  _obscurePassword.value =
                                  !_obscurePassword.value;
                                },
                                child: _obscurePassword.value
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined),
                              ),
                              label: const Text("Password"),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a Password";
                              } else {
                                return null;
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.07,
                ),
                RoundedButton(
                    loading: value.loading,
                    title: "Login",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        value.setLoading(true);
                        firebaseAuthenticationServices.logIn(
                            emailController.text.toString(),
                            passwordController.text.toString(),
                            context);
                      }
                    }),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.forgetPassword);
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.blackColor),
                      )),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signup);
                  },
                  child: Container(
                    height: height*0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.mainColor),
                    ),
                    child: const Center(
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}