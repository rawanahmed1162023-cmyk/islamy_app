import 'package:flutter/material.dart';
import '../models/sura_model.dart';
import 'sura_details_screen.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({Key? key}) : super(key: key);

 
  final List<SuraModel> suras = SuraModel.suras; 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/quran_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
          
              Center(
                child: SizedBox(
                  height: 120,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/img_branding.png',
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/images/islami.png',
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              
              const Text(
                "Suras List",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),

              
              Expanded(
                child: ListView.builder(
                  itemCount: suras.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: const Icon(
                      Icons.star_border,
                      color: Colors.white,
                      size: 35,
                    ),
                    title: Text(
                      suras[index].englishName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "${suras[index].versesCount} Verses",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Text(
                      suras[index].arabicName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuraDetailsScreen(sura: suras[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}