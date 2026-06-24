import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/article.dart';
part 'article_view_model.g.dart';

@riverpod
class ArticleViewModel extends _$ArticleViewModel {
  @override
  List<Article> build() {
    final List<Map<String, dynamic>> news = [
      {
        'id': 1,
        'title': 'မြန်မာမှာ ပြင်ဆင်ရမယ့် အယ်နီညို',
        'description':
            'ရာသီဥတုပြောင်းလဲမှုကြောင့် စိုက်ပျိုးရေးအပေါ် သက်ရောက်နိုင်ခြေများ။',
        'imageUrl': 'assets/images/1.jpeg',
        'date': '၂၈ မေလ ၂၀၂၆',
      },
      {
        'id' : 2, 
        'title': 'စပါးအထွက်နှုန်းတိုးအောင် ဘယ်လိုလုပ်ကြမလဲ',
        'description':
            'ခေတ်မီ စိုက်ပျိုးနည်းစနစ်များနှင့် ဓာတ်မြေဩဇာ သုံးစွဲနည်း။',
        'imageUrl': null,
        'date': '၂၉ မေလ ၂၀၂၆',
      },
      {
        'id' : 3, 
        'title': 'ပဲတီစိမ်း ဈေးကွက် အလားအလာ',
        'description':
            'ယခုနှစ် ပြည်ပပို့ကုန် ပဲတီစိမ်း ဈေးကွက် အခြေအနေ သုံးသပ်ချက်။',
        'imageUrl': 'assets/images/3.jpeg',
        'date': '၃၀ မေလ ၂၀၂၆',
      },
      {
        'id' : 4 , 
        'title': 'မြန်မာမှာ ပြင်ဆင်ရမယ့် အယ်နီညို',
        'description':
            'ရာသီဥတုပြောင်းလဲမှုကြောင့် စိုက်ပျိုးရေးအပေါ် သက်ရောက်နိုင်ခြေများ။',
        'imageUrl': 'assets/images/1.jpeg',
        'date': '၂၈ မေလ ၂၀၂၆',
      },
      {
        'id' : 5, 
        'title': 'စပါးအထွက်နှုန်းတိုးအောင် ဘယ်လိုလုပ်ကြမလဲ',
        'description':
            'ခေတ်မီ စိုက်ပျိုးနည်းစနစ်များနှင့် ဓာတ်မြေဩဇာ သုံးစွဲနည်း။',
        'imageUrl': null,
        'date': '၂၉ မေလ ၂၀၂၆',
      },
      {
        'id':6, 
        'title': 'ပဲတီစိမ်း ဈေးကွက် အလားအလာ',
        'description':
            'ယခုနှစ် ပြည်ပပို့ကုန် ပဲတီစိမ်း ဈေးကွက် အခြေအနေ သုံးသပ်ချက်။',
        'imageUrl': 'assets/images/3.jpeg',
        'date': '၃၀ မေလ ၂၀၂၆',
      },
    ];
    return news.map((m) => Article.formJson(m)).toList();
  }
}
