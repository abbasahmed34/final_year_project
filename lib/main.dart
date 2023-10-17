//lib/main.dart
import 'package:final_year_project/UI/splash.dart';
import 'package:final_year_project/view_model/provider_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Utils/Routes/routes_logic.dart';
import 'Utils/Routes/routes_names.dart';
import 'firebase_options.dart';



final ThemeData myTheme = ThemeData(
  primaryColor: const Color(0xfff97930), // Primary color
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xfff97930), // Primary color
    secondary: Colors.white, // Accent color
  ),
  fontFamily: 'Roboto', // Font family
);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});


  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> ProviderService())
    ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomeChef FoodLink',
      theme: myTheme,
      initialRoute: RoutesName.splashscreen,
      onGenerateRoute: Routes.generateRoutes,
      home: SplashScreen(),
    ),
    );
  }
}