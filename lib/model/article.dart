class Article {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String author;
  final String category;
  final String createdAt;

  Article({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.author,
    required this.category,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['_id'] ?? '',
      title: json['title']?.toString() ?? 'No Title',
      content: json['content']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      author: json['author']?.toString() ?? 'Admin',
      category: json['category']?.toString() ?? '',
      createdAt: json['createdAt']?.toString() ?? '',
    );
  }
}
