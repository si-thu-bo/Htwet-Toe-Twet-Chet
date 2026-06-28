import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:htwettoe_twetchet/helper/date_time.dart';
import 'package:htwettoe_twetchet/screens/article_view_screen.dart';
import 'package:htwettoe_twetchet/viewmodels/weather_view_model.dart';
import '../viewmodels/article_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articleViewModelProvider);
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
      body: RefreshIndicator(
        color: Colors.green,
        onRefresh: () async {
          ref.invalidate(articleViewModelProvider);
          await ref.watch(articleViewModelProvider.future);
          await ref.read(weatherViewModelProvider.notifier).refreshWeather();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _WeatherCard(),
                const SizedBox(height: 10),
                const Text(
                  'စိတ်ဝင်စားဖွယ် သတင်းများ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                articles.when(
                  data: (articles) {
                    if (articles.isEmpty) {
                      return const Center(child: Text('သတင်းများ မရှိသေးပါ။'));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: articles.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final article = articles[index];
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ArticleViewScreen(article: article),
                                ),
                              );
                            },
                            leading: article.imageUrl.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      8,
                                    ),
                                    child: Image.network(
                                      article.imageUrl,
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                                height: 80,

                                                width: 80,
                                                color: Colors.grey[300],
                                                child: Icon(
                                                  Icons.broken_image,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                    ),
                                  )
                                : Container(
                                    height: 80,
                                    width: 80,
                                    color: Colors.grey,
                                  ),
                            title: Text(article.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  article.content,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  formatDate(article.createdAt),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stack) => Center(child: Text('Error: $error')),
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WeatherCard extends ConsumerWidget {
  const _WeatherCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: weatherState.when(
        data: (weather) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                'https://openweathermap.org/img/wn/${weather.iconCode}@2x.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.cloud, size: 80, color: Colors.grey),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${weather.temperature.round()}°C',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    weather.location,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 30),
              const SizedBox(height: 5),
              Text('ရာသီဥတု မရရှိပါ', style: TextStyle(color: Colors.red[700])),
            ],
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
