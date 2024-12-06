import 'package:flutter/material.dart';

class QuranScreen extends StatefulWidget {
  final String location;

  QuranScreen({required this.location});

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  // List of all 114 Quran Surahs with number, Arabic, and English names
  final List<Map<String, String>> surahs = [
    {'number': '1', 'nameArabic': 'الفاتحة', 'nameEnglish': 'Al-Fatiha'},
    {'number': '2', 'nameArabic': 'البقرة', 'nameEnglish': 'Al-Baqarah'},
    {'number': '3', 'nameArabic': 'آل عمران', 'nameEnglish': 'Aal-E-Imran'},
    {'number': '4', 'nameArabic': 'النساء', 'nameEnglish': 'An-Nisa'},
    {'number': '5', 'nameArabic': 'المائدة', 'nameEnglish': 'Al-Ma’idah'},
    {'number': '6', 'nameArabic': 'الأنعام', 'nameEnglish': 'Al-An’am'},
    {'number': '7', 'nameArabic': 'الأعراف', 'nameEnglish': 'Al-A’raf'},
    {'number': '8', 'nameArabic': 'الأنفال', 'nameEnglish': 'Al-Anfal'},
    {'number': '9', 'nameArabic': 'التوبة', 'nameEnglish': 'At-Tawbah'},
    {'number': '10', 'nameArabic': 'يونس', 'nameEnglish': 'Yunus'},
    {'number': '11', 'nameArabic': 'هود', 'nameEnglish': 'Hud'},
    {'number': '12', 'nameArabic': 'يوسف', 'nameEnglish': 'Yusuf'},
    {'number': '13', 'nameArabic': 'الرعد', 'nameEnglish': 'Ar-Ra’d'},
    {'number': '14', 'nameArabic': 'إبراهيم', 'nameEnglish': 'Ibrahim'},
    {'number': '15', 'nameArabic': 'الحجر', 'nameEnglish': 'Al-Hijr'},
    {'number': '16', 'nameArabic': 'النحل', 'nameEnglish': 'An-Nahl'},
    {'number': '17', 'nameArabic': 'الإسراء', 'nameEnglish': 'Al-Isra'},
    {'number': '18', 'nameArabic': 'الكهف', 'nameEnglish': 'Al-Kahf'},
    {'number': '19', 'nameArabic': 'مريم', 'nameEnglish': 'Maryam'},
    {'number': '20', 'nameArabic': 'طه', 'nameEnglish': 'Taha'},
    {'number': '21', 'nameArabic': 'الأنبياء', 'nameEnglish': 'Al-Anbiya'},
    {'number': '22', 'nameArabic': 'الحج', 'nameEnglish': 'Al-Hajj'},
    {'number': '23', 'nameArabic': 'المؤمنون', 'nameEnglish': 'Al-Mu’minun'},
    {'number': '24', 'nameArabic': 'النور', 'nameEnglish': 'An-Nur'},
    {'number': '25', 'nameArabic': 'الفرقان', 'nameEnglish': 'Al-Furqan'},
    {'number': '26', 'nameArabic': 'الشعراء', 'nameEnglish': 'Ash-Shu’ara'},
    {'number': '27', 'nameArabic': 'النمل', 'nameEnglish': 'An-Naml'},
    {'number': '28', 'nameArabic': 'القصص', 'nameEnglish': 'Al-Qasas'},
    {'number': '29', 'nameArabic': 'العنكبوت', 'nameEnglish': 'Al-Ankabut'},
    {'number': '30', 'nameArabic': 'الروم', 'nameEnglish': 'Ar-Rum'},
    {'number': '31', 'nameArabic': 'لقمان', 'nameEnglish': 'Luqman'},
    {'number': '32', 'nameArabic': 'السجدة', 'nameEnglish': 'As-Sajda'},
    {'number': '33', 'nameArabic': 'الأحزاب', 'nameEnglish': 'Al-Ahzab'},
    {'number': '34', 'nameArabic': 'سبإ', 'nameEnglish': 'Saba'},
    {'number': '35', 'nameArabic': 'فاطر', 'nameEnglish': 'Fatir'},
    {'number': '36', 'nameArabic': 'يس', 'nameEnglish': 'Ya-Sin'},
    {'number': '37', 'nameArabic': 'الصافات', 'nameEnglish': 'As-Saffat'},
    {'number': '38', 'nameArabic': 'ص', 'nameEnglish': 'Sad'},
    {'number': '39', 'nameArabic': 'الزمر', 'nameEnglish': 'Az-Zumar'},
    {'number': '40', 'nameArabic': 'غافر', 'nameEnglish': 'Ghafir'},
    {'number': '41', 'nameArabic': 'فصلت', 'nameEnglish': 'Fussilat'},
    {'number': '42', 'nameArabic': 'الشورى', 'nameEnglish': 'Ash-Shura'},
    {'number': '43', 'nameArabic': 'الزخرف', 'nameEnglish': 'Az-Zukhruf'},
    {'number': '44', 'nameArabic': 'الدخان', 'nameEnglish': 'Ad-Dukhan'},
    {'number': '45', 'nameArabic': 'الجاثية', 'nameEnglish': 'Al-Jathiya'},
    {'number': '46', 'nameArabic': 'الأحقاف', 'nameEnglish': 'Al-Ahqaf'},
    {'number': '47', 'nameArabic': 'محمد', 'nameEnglish': 'Muhammad'},
    {'number': '48', 'nameArabic': 'الفتح', 'nameEnglish': 'Al-Fath'},
    {'number': '49', 'nameArabic': 'الحجرات', 'nameEnglish': 'Al-Hujurat'},
    {'number': '50', 'nameArabic': 'ق', 'nameEnglish': 'Qaf'},
    {'number': '51', 'nameArabic': 'الذاريات', 'nameEnglish': 'Adh-Dhariyat'},
    {'number': '52', 'nameArabic': 'الطور', 'nameEnglish': 'At-Tur'},
    {'number': '53', 'nameArabic': 'النجم', 'nameEnglish': 'An-Najm'},
    {'number': '54', 'nameArabic': 'القمر', 'nameEnglish': 'Al-Qamar'},
    {'number': '55', 'nameArabic': 'الرحمن', 'nameEnglish': 'Ar-Rahman'},
    {'number': '56', 'nameArabic': 'الواقعة', 'nameEnglish': 'Al-Waqi’a'},
    {'number': '57', 'nameArabic': 'الحديد', 'nameEnglish': 'Al-Hadid'},
    {'number': '58', 'nameArabic': 'المجادلة', 'nameEnglish': 'Al-Mujadila'},
    {'number': '59', 'nameArabic': 'الحشر', 'nameEnglish': 'Al-Hashr'},
    {'number': '60', 'nameArabic': 'الممتحنة', 'nameEnglish': 'Al-Mumtahina'},
    {'number': '61', 'nameArabic': 'الصف', 'nameEnglish': 'As-Saff'},
    {'number': '62', 'nameArabic': 'الجمعة', 'nameEnglish': 'Al-Jumu’a'},
    {'number': '63', 'nameArabic': 'المنافقون', 'nameEnglish': 'Al-Munafiqun'},
    {'number': '64', 'nameArabic': 'التغابن', 'nameEnglish': 'At-Taghabun'},
    {'number': '65', 'nameArabic': 'الطلاق', 'nameEnglish': 'At-Talaq'},
    {'number': '66', 'nameArabic': 'التحريم', 'nameEnglish': 'At-Tahrim'},
    {'number': '67', 'nameArabic': 'الملك', 'nameEnglish': 'Al-Mulk'},
    {'number': '68', 'nameArabic': 'القلم', 'nameEnglish': 'Al-Qalam'},
    {'number': '69', 'nameArabic': 'الحاقة', 'nameEnglish': 'Al-Haqqa'},
    {'number': '70', 'nameArabic': 'المعارج', 'nameEnglish': 'Al-Ma’arij'},
    {'number': '71', 'nameArabic': 'نوح', 'nameEnglish': 'Nuh'},
    {'number': '72', 'nameArabic': 'الجن', 'nameEnglish': 'Al-Jinn'},
    {'number': '73', 'nameArabic': 'المزمل', 'nameEnglish': 'Al-Muzzammil'},
    {'number': '74', 'nameArabic': 'المدثر', 'nameEnglish': 'Al-Muddathir'},
    {'number': '75', 'nameArabic': 'القيامة', 'nameEnglish': 'Al-Qiyama'},
    {'number': '76', 'nameArabic': 'الإنسان', 'nameEnglish': 'Al-Insan'},
    {'number': '77', 'nameArabic': 'المرسلات', 'nameEnglish': 'Al-Mursalat'},
    {'number': '78', 'nameArabic': 'النبإ', 'nameEnglish': 'An-Naba'},
    {'number': '79', 'nameArabic': 'النازعات', 'nameEnglish': 'An-Nazi’at'},
    {'number': '80', 'nameArabic': 'عبس', 'nameEnglish': 'Abasa'},
    {'number': '81', 'nameArabic': 'التكوير', 'nameEnglish': 'At-Takwir'},
    {'number': '82', 'nameArabic': 'الإنفطار', 'nameEnglish': 'Al-Infitar'},
    {'number': '83', 'nameArabic': 'المطففين', 'nameEnglish': 'Al-Mutaffifin'},
    {'number': '84', 'nameArabic': 'الإنشقاق', 'nameEnglish': 'Al-Inshiqaq'},
    {'number': '85', 'nameArabic': 'البروج', 'nameEnglish': 'Al-Buruj'},
    {'number': '86', 'nameArabic': 'الطارق', 'nameEnglish': 'At-Tariq'},
    {'number': '87', 'nameArabic': 'الأعلى', 'nameEnglish': 'Al-A’la'},
    {'number': '88', 'nameArabic': 'الغاشية', 'nameEnglish': 'Al-Ghashiya'},
    {'number': '89', 'nameArabic': 'الفجر', 'nameEnglish': 'Al-Fajr'},
    {'number': '90', 'nameArabic': 'البلد', 'nameEnglish': 'Al-Balad'},
    {'number': '91', 'nameArabic': 'الشمس', 'nameEnglish': 'Ash-Shams'},
    {'number': '92', 'nameArabic': 'الليل', 'nameEnglish': 'Al-Lail'},
    {'number': '93', 'nameArabic': 'الضحى', 'nameEnglish': 'Ad-Duhaa'},
    {'number': '94', 'nameArabic': 'الشرح', 'nameEnglish': 'Ash-Sharh'},
    {'number': '95', 'nameArabic': 'التين', 'nameEnglish': 'At-Tin'},
    {'number': '96', 'nameArabic': 'العلق', 'nameEnglish': 'Al-Alaq'},
    {'number': '97', 'nameArabic': 'القدر', 'nameEnglish': 'Al-Qadr'},
    {'number': '98', 'nameArabic': 'البينة', 'nameEnglish': 'Al-Bayyina'},
    {'number': '99', 'nameArabic': 'الزلزلة', 'nameEnglish': 'Az-Zalzala'},
    {'number': '100', 'nameArabic': 'العاديات', 'nameEnglish': 'Al-Adiyat'},
    {'number': '101', 'nameArabic': 'القارعة', 'nameEnglish': 'Al-Qaria'},
    {'number': '102', 'nameArabic': 'التكاثر', 'nameEnglish': 'At-Takathur'},
    {'number': '103', 'nameArabic': 'العصر', 'nameEnglish': 'Al-Asr'},
    {'number': '104', 'nameArabic': 'الهمزة', 'nameEnglish': 'Al-Humaza'},
    {'number': '105', 'nameArabic': 'الفيل', 'nameEnglish': 'Al-Fil'},
    {'number': '106', 'nameArabic': 'قريش', 'nameEnglish': 'Quraish'},
    {'number': '107', 'nameArabic': 'الماعون', 'nameEnglish': 'Al-Ma’un'},
    {'number': '108', 'nameArabic': 'الكوثر', 'nameEnglish': 'Al-Kawthar'},
    {'number': '109', 'nameArabic': 'الكافرون', 'nameEnglish': 'Al-Kafirun'},
    {'number': '110', 'nameArabic': 'النصر', 'nameEnglish': 'An-Nasr'},
    {'number': '111', 'nameArabic': 'المسد', 'nameEnglish': 'Al-Masad'},
    {'number': '112', 'nameArabic': 'الإخلاص', 'nameEnglish': 'Al-Ikhlas'},
    {'number': '113', 'nameArabic': 'الفلق', 'nameEnglish': 'Al-Falaq'},
    {'number': '114', 'nameArabic': 'الناس', 'nameEnglish': 'An-Nas'}
  ];

  // To store favorite status for each surah
  List<bool> favoriteStatus = List.generate(114, (index) => false);

  // Search query and filtered surah list
  String searchQuery = "";
  List<Map<String, String>> filteredSurahs = [];

  @override
  void initState() {
    super.initState();
    filteredSurahs = surahs;
  }

  // Function to handle search filter
  void _filterSurahs(String query) {
    setState(() {
      searchQuery = query;
      filteredSurahs = surahs.where((surah) {
        String arabicName = surah['nameArabic']!.toLowerCase();
        String englishName = surah['nameEnglish']!.toLowerCase();
        return surah['number']!.contains(query) ||
            arabicName.contains(query.toLowerCase()) ||
            englishName.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AL-Quran"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterSurahs,
              decoration: InputDecoration(
                hintText: 'Search by number, English or Arabic name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // List of surahs
          Expanded(
            child: ListView.builder(
              itemCount: filteredSurahs.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      '${filteredSurahs[index]['number']}. ${filteredSurahs[index]['nameEnglish']} - ${filteredSurahs[index]['nameArabic']}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        favoriteStatus[
                                int.parse(filteredSurahs[index]['number']!) - 1]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favoriteStatus[
                                int.parse(filteredSurahs[index]['number']!) - 1]
                            ? Colors.red
                            : null,
                      ),
                      onPressed: () {
                        setState(() {
                          favoriteStatus[
                              int.parse(filteredSurahs[index]['number']!) -
                                  1] = !favoriteStatus[
                              int.parse(filteredSurahs[index]['number']!) - 1];
                        });
                      },
                    ),
                    onTap: () {
                      // You can handle tapping on a specific Surah if needed
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
