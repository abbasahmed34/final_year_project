import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Firebase_services/Authentication_services/services.dart';
import '../../Utils/Routes/routes_names.dart';
import '../../Utils/utils.dart';
import '../../resources/components/app_colors.dart';
import '../../resources/components/rounded_button.dart';
import '../../view_model/provider_auth_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  FirebaseAuthenticationServices firebaseAuthenticationServices = FirebaseAuthenticationServices();

  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(false);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameNode.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<ProviderService>(builder: (context, value,child){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height*0.4,
                        child: const Image(image: AssetImage("assets/images/logo.png"),),
                      ),

                    ],
                  ),
                  const Text(
                    "Create a HomeChef account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: AppColors.blackColor),
                  ),
                  SizedBox(height: height*0.06),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          focusNode: nameNode,
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Full Name",
                            prefixIcon: Icon(Icons.person_outline_rounded),
                            label: Text("Full Name"),
                          ),
                          onFieldSubmitted: (value){
                            Utils.onFieldFocus(context, nameNode, emailNode);
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter the Name";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: height*0.02,),
                        TextFormField(
                          focusNode: emailNode,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.alternate_email_outlined),
                            label: Text("Email"),
                          ),
                          onFieldSubmitted: (value){
                            Utils.onFieldFocus(context, emailNode, passwordNode);
                          },
                          validator: (value){
                            if(value!.isEmpty || !value.contains('@')){
                              return "Enter Email";
                            }else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: height*0.02,),
                        ValueListenableBuilder(
                            valueListenable: _obscurePassword,
                            builder: (context,value,child){
                              return TextFormField(
                                focusNode: passwordNode,
                                controller: passwordController,
                                obscureText: _obscurePassword.value,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: const Icon(Icons.lock_open_rounded),
                                  suffixIcon: InkWell(
                                    onTap: (){
                                      _obscurePassword.value =  !_obscurePassword.value;
                                    },
                                    child: _obscurePassword.value ? const Icon(Icons.visibility_off_outlined): const Icon(Icons.visibility_outlined),
                                  ),
                                  label: const Text("Password"),
                                ),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6){
                                    return "Enter a password having 6 or more characters";
                                  }else{
                                    return null;
                                  }
                                },
                              );
                            }),
                      ],
                    ),),

                  SizedBox(height: height*0.08,),
                  RoundedButton(loading: value.loading,title: "Continue", onTap: (){
                    if(_formKey.currentState!.validate()){
                      value.setLoading(true);
                      firebaseAuthenticationServices.signUp(emailController.text.toString(), passwordController.text.toString(),context);
                    }


                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, RoutesName.login);

                      }, child: const Text("Login"))
                    ],
                  ),



                ],
              );
            })
        ),
      ),
    );
  }
}

