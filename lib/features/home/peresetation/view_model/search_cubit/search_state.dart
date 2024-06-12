part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchSuccess extends SearchState {
  final OthersQuoteModel othersQuoteModel;

  SearchSuccess({required this.othersQuoteModel});
}
final class SearchLoading extends SearchState {}
final class SearchFaliure extends SearchState {
  final String errMessage;

  SearchFaliure({required this.errMessage});
}
