class Article {
  final int id; 
  final String title;
  final String description;
  final String imageUrl;
  final String date;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  factory Article.formJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'] ?? '',
      date: json['date'],
    );
  }
}
