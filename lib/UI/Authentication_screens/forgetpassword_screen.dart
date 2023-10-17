import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Firebase_services/Authentication_services/services.dart';
import '../../resources/components/rounded_button.dart';
import '../../view_model/provider_auth_services.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final emailController = TextEditingController();
  FirebaseAuthenticationServices firebaseAuthenticationServices = FirebaseAuthenticationServices();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Consumer<ProviderService>(
              builder: (context, value, child){
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.05 ),
                      const Text(
                        "Forgot",
                        style: TextStyle(
                            color: Color(0xff091E42),
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Password?",
                        style: TextStyle(
                            color: Color(0xff091E42),
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: height*0.03,
                      ),
                      Text(
                        "Don't worry! It happens, Please enter the address associated with your account.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: "Roboto Regular",
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: height*0.11,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.alternate_email_outlined,
                            color: Color(0xff7F8B9D),
                          ),
                          SizedBox(
                            width: width*0.03,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                fontFamily: "Roboto Medium",
                                color: Color(0xff091E42),
                              ),
                              decoration: InputDecoration(
                                  hintText: 'Email ID',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.grey.withOpacity(0.2)),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.06,),
                      RoundedButton(loading: value.loading,title: "Submit", onTap: (){
                        value.setLoading(true);
                        firebaseAuthenticationServices.forgotPassword(emailController.text.toString(), context);
                      })
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}