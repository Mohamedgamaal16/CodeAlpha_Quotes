part of 'others_quote_cubit.dart';

@immutable
sealed class OthersQuoteState {}

final class OthersQuoteInitial extends OthersQuoteState {}
final class OthersQuotesSuccess extends OthersQuoteState {
  final OthersQuoteModel quote;
  OthersQuotesSuccess({required this.quote});
}



final class OthersQuotesLoading extends OthersQuoteState {}

final class OthersQuotesFaliure extends OthersQuoteState {
  final String message;

  OthersQuotesFaliure({required this.message});
}
