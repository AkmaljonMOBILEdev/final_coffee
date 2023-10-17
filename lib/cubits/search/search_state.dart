part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchNotFound extends SearchState {}
class SearchSuccess extends SearchState {
  final List<CoffeeModel> items;

  SearchSuccess({required this.items});


}
