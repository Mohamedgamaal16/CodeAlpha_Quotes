import 'package:dartz/dartz.dart';
import 'package:quotes/features/authors/data/model/author_model.dart';

abstract class AuthorRepo {
  Future<Either<String, AuthorModel>> fetchAuthors();
  
}