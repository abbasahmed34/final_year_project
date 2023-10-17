import 'package:flutter/material.dart';

import '../Utils/Routes/routes_names.dart';
import '../resources/components/app_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HomeChef!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: AppColors.mainColor),
              ),
              SizedBox(
                width: 05,
              ),
              Text(
                "FoodLink",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: AppColors.blackColor),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
              radius: height*0.2,
              child: const Image(
                image: AssetImage("assets/images/logo.png"),
              )),
          const Text(
            "Discover the new ways of managing\n your meal plans.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Rubik', fontSize: 19.5, color: Colors.black87),
          ),
          SizedBox(
            height: height*0.03,
          ),
          Container(
            height: height*.35,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "All we want you to eat, drink and\nlive healthy with us.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: AppColors.whiteColor),
                ),
                SizedBox(
                  height: height*0.08,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black87),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Get Started",
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              color: AppColors.whiteColor,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: width*0.02,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.whiteColor,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}