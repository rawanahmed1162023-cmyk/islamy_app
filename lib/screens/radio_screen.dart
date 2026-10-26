import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Background (3).png'),
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
                    Image.asset('assets/images/Mosque-01 1.png', fit: BoxFit.contain),
                    Image.asset('assets/images/Islami.png', height: 45, fit: BoxFit.contain),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF202020),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2BE7F),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text("Radio", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: const Text("Reciters", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              
              Expanded(
                child: ListView(
                  children: [
                    radioItem("Radio Ibrahim Al-Akdar"),
                    radioItem("Radio Al-Qaria Yassen"),
                    radioItem("Radio Ahmed Al-Trabulsi"),
                    radioItem("Radio Addokali Mohammad Alalim"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget radioItem(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE2BE7F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.play_arrow, size: 36, color: Colors.black),
              const SizedBox(width: 20),
              const Icon(Icons.volume_up, size: 28, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}