// Define the ResultItem class
class ResultItem {
  final String id;
  final String name;
  final String bio;
  final String description;
  final String link;
  final int quoteCount;
  final String slug;
  final String dateAdded;
  final String dateModified;

  ResultItem({
    required this.id,
    required this.name,
    required this.bio,
    required this.description,
    required this.link,
    required this.quoteCount,
    required this.slug,
    required this.dateAdded,
    required this.dateModified,
  });

  factory ResultItem.fromJson(Map<String, dynamic> json) {
    return ResultItem(
      id: json['_id'],
      name: json['name'],
      bio: json['bio'],
      description: json['description'],
      link: json['link'],
      quoteCount: json['quoteCount'],
      slug: json['slug'],
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'bio': bio,
      'description': description,
      'link': link,
      'quoteCount': quoteCount,
      'slug': slug,
      'dateAdded': dateAdded,
      'dateModified': dateModified,
    };
  }
}

// Define the MainResponse class
class AuthorModel {
  final int count;
  final int totalCount;
  final int page;
  final int totalPages;
  final int lastItemIndex;
  final List<ResultItem> results;

  AuthorModel({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    required this.results,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<ResultItem> resultsList =
        list.map((i) => ResultItem.fromJson(i)).toList();

    return AuthorModel(
      count: json['count'],
      totalCount: json['totalCount'],
      page: json['page'],
      totalPages: json['totalPages'],
      lastItemIndex: json['lastItemIndex'],
      results: resultsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'totalCount': totalCount,
      'page': page,
      'totalPages': totalPages,
      'lastItemIndex': lastItemIndex,
      'results': results.map((v) => v.toJson()).toList(),
    };
  }
}
