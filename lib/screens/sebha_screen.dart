import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
 
  int counter = 0;
  
  
  int currentIndex = 0;

  
  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "استغفر الله"
  ];

 
  void onSebhaPressed() {
    setState(() {
      counter++;
      
      if (counter > 30) {
        counter = 0;
        currentIndex = (currentIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Background.png'), 
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
             
              SizedBox(
                height: 110,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Mosque-01 1.png', 
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'assets/images/Islami.png', 
                      height: 45,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              
              const Text(
                "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),

              
              GestureDetector(
                onTap: onSebhaPressed,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                   
                    Image.asset(
                      'assets/images/SebhaBody 1.png',
                      height: 320,
                      fit: BoxFit.contain,
                    ),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          azkar[currentIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "$counter",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}