class QuoteModel {
  final int count;
  final int totalCount;
  final int page;
  final int totalPages;
  final int lastItemIndex;
  final List<Quote> results;

  QuoteModel({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    required this.results,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      count: json['count'] as int,
      totalCount: json['totalCount'] as int,
      page: json['page'] as int,
      totalPages: json['totalPages'] as int,
      lastItemIndex: json['lastItemIndex'] as int,
      results: (json['results'] as List)
          .map((result) => Quote.fromJson(result))
          .toList(),
    );
  }
}

class Quote {
  final String id;
  final String author;
  final String content;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  Quote({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      tags: (json['tags'] as List).map((tag) => tag as String).toList(),
      authorSlug: json['authorSlug'] as String,
      length: json['length'] as int,
      dateAdded: json['dateAdded'] as String,
      dateModified: json['dateModified'] as String,
    );
  }
}
