import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({Key? key}) : super(key: key);


  Future<void> _launchAzkarUrl() async {
    final Uri url = Uri.parse('https://www.islambook.com/azkar/1/%D8%A3%D8%B0%D9%83%D8%A7%D8%B1-%D8%A7%D9%84%D8%B5%D8%A8%D8%A7%D8%AD'); // حطّي الرابط اللي تحبيه هنا
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/more_bg.png'),
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
                  height: 110,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/Mosque-01 1.png', fit: BoxFit.contain),
                      Image.asset('assets/images/Islami.png', height: 45, fit: BoxFit.contain),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF202020),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2BE7F), width: 1),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("16 Jul, 2024", style: TextStyle(color: Colors.white, fontSize: 14)),
                        Text("Pray Time\nTuesday", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("09 Muh,\n1446", textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        prayTimeBox("Fajr", "04:04"),
                        prayTimeBox("Dhuhr", "01:01"),
                        prayTimeBox("Asr", "04:38"),
                        prayTimeBox("Maghrib", "07:57"),
                        prayTimeBox("Isha", "09:32"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text("Azkar", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
             
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: _launchAzkarUrl,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF202020),borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2BE7F)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/bell-icon 1.png', height: 100, fit: BoxFit.contain), // أو صورة الأذكار الخاصة بك
                              const SizedBox(height: 10),
                              const Text("Evening Azkar", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: _launchAzkarUrl,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF202020),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2BE7F)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/comment-bubble-icon 1.png', height: 100, fit: BoxFit.contain),
                              const SizedBox(height: 10),
                              const Text("Morning Azkar", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget prayTimeBox(String name, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 5),
          Text(time, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}