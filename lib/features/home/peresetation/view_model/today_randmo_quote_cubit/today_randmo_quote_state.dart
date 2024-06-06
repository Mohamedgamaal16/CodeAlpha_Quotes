part of 'today_randmo_quote_cubit.dart';

@immutable
sealed class TodayRandmoQuoteState {}

final class TodayRandmoQuoteInitial extends TodayRandmoQuoteState {}
final class TodyRandomQuoteSuccess extends TodayRandmoQuoteState {
  final RandomQuoteModel quote;
  TodyRandomQuoteSuccess({required this.quote});
}

final class TodyRandomQuoteLoading extends TodayRandmoQuoteState {}

final class TodyRandomQuoteFaliure extends TodayRandmoQuoteState {
  final String message;

  TodyRandomQuoteFaliure({required this.message});
}
