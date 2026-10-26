class SuraModel {
  final String arabicName;
  final String englishName;
  final String versesCount;
  final String fileName; 

  SuraModel({
    required this.arabicName,
    required this.englishName,
    required this.versesCount,
    required this.fileName,
  });
}


List<SuraModel> suras = [
  SuraModel(arabicName: "الفاتحة", englishName: "Al-Fatiha", versesCount: "7", fileName: "1.txt"),
  SuraModel(arabicName: "البقرة", englishName: "Al-Baqarah", versesCount: "286", fileName: "2.txt"),
  SuraModel(arabicName: "آل عمران", englishName: "Aal-E-Imran", versesCount: "200", fileName: "3.txt"),
  SuraModel(arabicName: "النساء", englishName: "An-Nisa", versesCount: "176", fileName: "4.txt"),
  SuraModel(arabicName: "المائدة", englishName: "Al-Ma'idah", versesCount: "120", fileName: "5.txt"),
  SuraModel(arabicName: "الأنعام", englishName: "Al-An'am", versesCount: "165", fileName: "6.txt"),
  SuraModel(arabicName: "الأعراف", englishName: "Al-A'raf", versesCount: "206", fileName: "7.txt"),

];