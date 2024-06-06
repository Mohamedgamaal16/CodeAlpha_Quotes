class RandomQuoteModel {
  final String id;
  final String content;
  final String author;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final DateTime dateAdded;
  final DateTime dateModified;

  RandomQuoteModel({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory RandomQuoteModel.fromJson(Map<String, dynamic> json) {
    return RandomQuoteModel(
      id: json['_id'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      tags: (json['tags'] as List).map((tag) => tag as String).toList(),
      authorSlug: json['authorSlug'] as String,
      length: json['length'] as int,
      dateAdded: DateTime.parse(json['dateAdded'] as String),
      dateModified: DateTime.parse(json['dateModified'] as String),
    );
  }
}
