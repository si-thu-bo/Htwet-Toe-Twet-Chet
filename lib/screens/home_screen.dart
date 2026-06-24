import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:htwettoe_twetchet/screens/article_view_screen.dart';
import 'package:htwettoe_twetchet/viewmodels/weather_view_model.dart';
import '../viewmodels/article_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articleViewModelProvider);
    final weatherAsync = ref.watch(weatherViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/images/logo.png', width: 50),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ထွက်တိုး တွက်ချက်',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  'စိုက်ပျိုးရေး အထောက်အကူပြု ဆော့ဝဲလ်',
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ],
        ),

        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.notifications,
                size: 40,
                color: Colors.green[400],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              weatherAsync.when(
                data: (weather) {
                  return Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.temp.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(weather.cityName),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                error: (error, statck) =>
                    const Text('ရာသီဥတု အချက်အလက် မရနိုင်ပါ'),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
              const SizedBox(height: 10),
              const Text(
                'စိတ်ဝင်စားဖွယ် သတင်းများ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int index) {
                  final article = articles[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleViewScreen(),
                          ),
                        );
                      },
                      leading: article.imageUrl.isNotEmpty
                          ? Image.asset(article.imageUrl, height: 80, width: 80)
                          : Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey,
                            ),
                      title: Text(article.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(article.description),
                          Text(article.date),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

