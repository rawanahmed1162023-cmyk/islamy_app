import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/sura_model.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'sura_details';
  final SuraModel sura;

  const SuraDetailsScreen({Key? key, required this.sura}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          sura.englishName,
          style: const TextStyle(
            color: AppColors.primaryGold,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.primaryGold),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Text(
                  sura.arabicName,
                  style: const TextStyle(
                    color: AppColors.primaryGold,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                
              
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                  
                      ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        children: const [
                          Text(
                            "بسم الله الرحمن الرحيم\n[1] الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ\n[2] الرَّحْمَٰنِ الرَّحِيمِ\n[3] مَالِكِ يَوْمِ الدِّينِ\n[4] إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ\n[5] اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryGold,
                              fontSize: 18,
                              height: 2.2,
                            ),
                          ),
                        ],
                      ),

                      
                      Positioned(
                        left: 0,
                        top: 20,
                        child: Image.asset(
                          'assets/images/img_left_corner.png', 
                          width: 45,
                        ),
                      ),

                      
                      Positioned(
                        right: 0,
                        top: 20,
                        child: Image.asset(
                          'assets/images/img_right_corner.png', 
                          width: 45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

         
          Image.asset(
            'assets/images/img_bottom_decoration.png',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}