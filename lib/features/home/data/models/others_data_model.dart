class OthersQuoteModel {
  final Info info;
  final int count;
  final int totalCount;
  final int page;
  final int totalPages;
  final List<Quote> results;

  OthersQuoteModel({
    required this.info,
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.results,
  });

  factory OthersQuoteModel.fromJson(Map<String, dynamic> json) {
    return OthersQuoteModel(
      info: Info.fromJson(json['__info__']),
      count: json['count'] as int,
      totalCount: json['totalCount'] as int,
      page: json['page'] as int,
      totalPages: json['totalPages'] as int,
      results: (json['results'] as List)
          .map((result) => Quote.fromJson(result))
          .toList(),
    );
  }
}

class Info {
  final Search search;

  Info({
    required this.search,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      search: Search.fromJson(json['\$search']),
    );
  }
}

class Search {
  final QueryString queryString;

  Search({
    required this.queryString,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      queryString: QueryString.fromJson(json['queryString']),
    );
  }
}

class QueryString {
  final String query;
  final String defaultPath;

  QueryString({
    required this.query,
    required this.defaultPath,
  });

  factory QueryString.fromJson(Map<String, dynamic> json) {
    return QueryString(
      query: json['query'] as String,
      defaultPath: json['defaultPath'] as String,
    );
  }
}

class Quote {
  final String id;
  final String author;
  final String content;
  final List<String> tags;
  final String authorId;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  Quote({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorId,
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
      authorId: json['authorId'] as String,
      authorSlug: json['authorSlug'] as String,
      length: json['length'] as int,
      dateAdded: json['dateAdded'] as String,
      dateModified: json['dateModified'] as String,
    );
  }
}
