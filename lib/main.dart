import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/add_recipe/controller/add_recipe_controller.dart';
import 'package:recipe_app/presentation/all_categories/controller/all_categories_controller.dart';
import 'package:recipe_app/presentation/chef_registartion_page/controller/chef_registraion_controller.dart';
import 'package:recipe_app/presentation/creators/controller/creators_controller.dart';
import 'package:recipe_app/presentation/detailed_catagory_screen/controller/detailed_catogary_controller.dart';
import 'package:recipe_app/presentation/explorepage/controller/expolre_page_controller.dart';
import 'package:recipe_app/presentation/feed_page/controller/feed_page_controller.dart';
import 'package:recipe_app/presentation/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:recipe_app/presentation/login/controller/login_controller.dart';
import 'package:recipe_app/presentation/registration/controller/registration_controller.dart';
import 'package:recipe_app/presentation/splashscreen/welcom.dart';
import 'package:recipe_app/presentation/user_profile/controller/user_profile_controller.dart';
import 'presentation/homepage/controller/home_controller.dart';
import 'presentation/saved/controller/saved_page_controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeController()),
      ChangeNotifierProvider(create: (context) => RegistrationController()),
      ChangeNotifierProvider(create: (context) => LoginController()),
      ChangeNotifierProvider(
        create: (context) => AddRecipeController(),
      ),
      ChangeNotifierProvider(
          create: (context) => AllCategoriesScreenController()),
      ChangeNotifierProvider(create: (context) => ExplorePageController()),
      ChangeNotifierProvider(create: (context) =>CreatorsController() ),
      ChangeNotifierProvider(create: (context) => DetailedCatogoryController()),
      ChangeNotifierProvider(create: (context) => UserProfileController()),
      ChangeNotifierProvider(create: (context) => ForgotPasswordController()),
      ChangeNotifierProvider(create: (context) => ChefRegistrationController()),
       ChangeNotifierProvider(create: (context) => FeedPageController()),
        ChangeNotifierProvider(create: (context) => SavedController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WelcomePage(),
      ),
    );
  }
}
