
import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/welcomeScreen.dart';
import 'package:paypal_ui_app/ui/widget/OnboardingItem_widget.dart';
class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});
  static const String name='/Onboarding screen';

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController _pageController=PageController();
  int _currentPage= 0;
  @override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }
  void _onNext() {
    if(_currentPage < 3){
      _pageController.nextPage(
          duration: Duration(milliseconds: 350),
          curve: Curves.easeInOut);
    }else{
      Navigator.pushReplacementNamed(
          context, welcomeScreen.name);
    }
  }
  void _onSkip(){
    _pageController.animateToPage(
        3,
        duration: Duration(milliseconds: 500),
        curve:Curves.easeInOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Onboarding Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  OnboardingItem(
                    customContent: null,
                    image: 'asset/shopping buscet.png',
                    tittle: 'The safer, easier \n way to pay',
                    description: 'Up to days 0f buy protection \n no ',
                  ),
                  OnboardingItem(
                    customContent: null,
                    image: '',
                    tittle: 'Send and request\n payment with paypal',
                    description: 'Up to days 0f buy protection no ',
                  ),
                  OnboardingItem(
                    customContent: null,
                    image: '',
                    tittle: 'Shop warry free \n with paypal',
                    description: 'Up to days 0f buy protection no ',
                  ),
                  OnboardingItem(
                    customContent: null,
                    image: '',
                    tittle: 'The safer, easier \n way to pay',
                    description: 'Up to days 0f buy protection no ',
                  ),
                ],
              ),
            ),
            
            // 4 Dot Indicators
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => _buildDot(index == _currentPage),
                ),
              ),
            ),

            // Navigation Buttons
           Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(_currentPage == 4 ? 'Get Started' : 'Next'),
                    ),
                  ),
                  TextButton(
                    onPressed: _onSkip,
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }


  }

Widget _buildDot(bool active){
  return AnimatedContainer(
      duration: Duration(milliseconds: 250),
    margin: EdgeInsets.symmetric(horizontal: 4),
    width: active ? 24 : 8,
    height: 8,
    decoration: BoxDecoration(
      color: active ?Colors.blueAccent.shade200 : Colors.grey.shade300,
      borderRadius: BorderRadius.circular(4),
    ),
  );
}


