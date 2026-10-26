import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/time_screen.dart';
import '../core/app_colors.dart';
import '../models/sura_model.dart';
import 'sura_details_screen.dart';
import 'hadeth_details_screen.dart';
import '../models/hadeth_model.dart';
import 'sebha_screen.dart';
import 'radio_screen.dart';
import 'time_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String searchQuery = ""; 

  
  final List<HadethModel> ahadethList = [
    HadethModel(
      title: "الحديث الأول",
      content: "عن أمير المؤمنين أبي حفص عمر بن الخطاب رضي الله عنه ، قال : سمعت رسول الله صلى الله عليه وسلم يقول : ( إنما الأعمال بالنيات وإنما لكل امرئ ما نوى ، فمن كانت هجرته إلى الله ورسوله فهجرته إلى الله ورسوله ، ومن كانت هجرته لدنيا يصيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه ).",
    ),
    HadethModel(
      title: "الحديث الثاني",
      content: "عن عمر رضي الله عنه أيضاً قال: بينما نحن جلوس ذات يوم عند رسول الله صلى الله عليه وسلم إذ طلع علينا رجل شديد بياض الثياب شديد سواد الشعر...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
  
    final filteredSuras = suras.where((sura) {
      return sura.arabicName.contains(searchQuery) ||
             sura.englishName.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    final List<Widget> tabs = [
      
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background (2).png'),
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
          'assets/images/Mosque-01 1.png',
          fit: BoxFit.contain,
        ),
        
        
        Image.asset(
          'assets/images/Islami.png', 
          height: 50, 
          fit: BoxFit.contain,
        ),
      ],
    ),
  ),
),
const SizedBox(height: 10),
                  
              
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Sura Name',
                    hintStyle: const TextStyle(color: Colors.white54),
                    prefixIcon: const Icon(Icons.search, color: AppColors.primaryGold),
                    fillColor: Colors.black54,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primaryGold),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primaryGold, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                if (searchQuery.isEmpty) ...[const Text(
                    "Most Recently",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 220,
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryGold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    suras[index].englishName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    suras[index].arabicName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${suras[index].versesCount} Verses",
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(Icons.menu_book, size: 45, color: Colors.black38),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                Text(
                  getSurasTitle(searchQuery),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

              
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredSuras.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(
                        Icons.star_border,
                        color: Colors.white,
                        size: 35,
                      ),
                      title: Text(filteredSuras[index].englishName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        "${filteredSuras[index].versesCount} Verses",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Text(
                        filteredSuras[index].arabicName,
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
                            builder: (context) => SuraDetailsScreen(sura: filteredSuras[index]),
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
      ),

     
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hadith_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    'assets/images/Islami.png',
                    height: 60,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView.builder(
                    itemCount: ahadethList.length,
                    controller: PageController(viewportFraction: 0.85),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HadethDetailsScreen(hadeth: ahadethList[index]),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.primaryGold,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Column(
                            children: [
                              Text(
                                ahadethList[index].title,
                                style: const TextStyle(
                                  color: AppColors.primaryDark,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                              const Divider(color: AppColors.primaryDark, thickness: 1.5),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Text(
                                  ahadethList[index].content,
                                  textAlign: TextAlign.center,
                                  maxLines: 8,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.primaryDark,
                                    fontSize: 16,
                                    height: 1.8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),


      const SebhaScreen(),
      const RadioScreen(),
      const TimeScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryGold,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.primaryDark,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quran'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Hadeth'),
          BottomNavigationBarItem(icon: Icon(Icons.radio_button_checked), label: 'Sebha'),
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'Radio'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Time'),
        ],
      ),
    );
  }

  String getSurasTitle(String query) {
    return query.isEmpty ? "Suras List" : "Search Results";
  }
}