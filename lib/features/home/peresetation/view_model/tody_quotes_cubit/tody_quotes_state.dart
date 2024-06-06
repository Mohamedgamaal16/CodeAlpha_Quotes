part of 'tody_quotes_cubit.dart';

@immutable
sealed class TodyQuotesState {}

final class TodyQuotesInitial extends TodyQuotesState {}

final class TodyQuotesSuccess extends TodyQuotesState {
  final QuoteModel quote;
  TodyQuotesSuccess({required this.quote});
}



final class TodyQuotesLoading extends TodyQuotesState {}

final class TodyQuotesFaliure extends TodyQuotesState {
  final String message;

  TodyQuotesFaliure({required this.message});
}
