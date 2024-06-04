import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/features/home/peresetation/views/home_view.dart';
import 'package:quotes/features/home/peresetation/views/widgets/homw_view_body.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  final List<Widget> appPages = [
    const HomeViewBody(),
    const HomeViewBody(),
    const HomeViewBody(),
    const HomeViewBody(),
  ];
  void changePages(int value) {
    currentIndex = value;
    emit(PageChanged());
  }
}
