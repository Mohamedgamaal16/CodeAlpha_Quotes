import 'package:dartz/dartz.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/core/errors/exceptions.dart';
import 'package:quotes/features/authors/data/model/author_model.dart';
import 'package:quotes/features/authors/data/repos/author_repo.dart';

class AuthorRpoImbl implements AuthorRepo {
  final ApiConsumer api;

  AuthorRpoImbl({required this.api});
  @override
  Future<Either<String, AuthorModel>> fetchAuthors() async {
    try {
      final reposne = await api.get(EndPoint.authors);
      final  data = AuthorModel.fromJson(reposne);
      return right(data);
    } on AuthServerException catch (e) {
      return left(e.errModel.message);
    }
  }
}
