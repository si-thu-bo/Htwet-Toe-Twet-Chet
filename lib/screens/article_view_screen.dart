import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleViewScreen extends ConsumerWidget {
  const ArticleViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'မြန်မာနိုင်ငံမှာ ပြင်ဆင်ရမယ့် အယ်နီညို ကျော်ကြီးများ နေသည်',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,

                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset('assets/images/1.jpeg', fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'အယ်နီညို',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'ရာသီဥတုပြောင်းလဲမှုကြောင့် စိုက်ပျိုးရေးအပေါ် သက်ရောက်နိုင်ခြေများ။',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
