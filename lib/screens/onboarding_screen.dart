import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'home_screen.dart'; 
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/Islami.png', 
                height: 40,
              ),
            ),
            
            
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 5, 
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Expanded(
                          child: Image.asset(
                            'assets/images/intro_${index + 1}.png', 
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        const Text(
                          "Welcome To Islami",
                          style: TextStyle(
                            color: AppColors.primaryGold,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        
                        const Text(
                          "We Are Very Excited To Have You In Our Community",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  currentIndex > 0
                      ? TextButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(color: AppColors.primaryGold),
                          ),
                        )
                      : const SizedBox(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGold,
                    ),
                    onPressed: () {
                      if (currentIndex < 4) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        
                        Navigator.pushReplacement(
                         context,
                         MaterialPageRoute(builder: (context) => const HomeScreen()),
);
                      }
                    },
                    child: Text(
                      currentIndex == 4 ? "Finish" : "Next",
                      style: const TextStyle(color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}