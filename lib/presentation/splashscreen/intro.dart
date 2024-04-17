import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:recipe_app/presentation/splashscreen/get_started.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: const Text(
              'Welcome  to RecipeBook',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "Your Gourmet Guide: Seamlessly Organize and Map Out Your Culinary Creations with recipeBook...",
            image: Container(
              child: Image.asset(
                "assets/images/splash_3.jpg",
                height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              ),
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              'Welcome  to RecipeBook',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "Your Personal recipe organizer and planner.Store Your recipes on the recipeBook...",
            image: Image.asset(
              "assets/images/splash_one.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              'Quick and Easy Recipes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            body:
                "Your Culinary Companion: Effortlessly Manage and Plan Your Recipes with recipeBook...",
            image: Image.asset(
              "assets/images/splash_2.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
        onDone: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GetStarted(),
              ));
        },
        onSkip: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GetStarted(),
              ));
        },
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.deepOrange,
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.deepOrange,
        ),
        done: const Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.deepOrange,
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          activeSize: const Size(20, 10),
          color: Colors.black26,
          activeColor: Colors.deepOrange,
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
