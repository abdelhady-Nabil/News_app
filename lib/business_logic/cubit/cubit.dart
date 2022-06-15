import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test/business_logic/cubit/states.dart';
import 'package:news_test/data/dio_helper.dart';
import 'package:news_test/presentation/screens/business_screen.dart';
import 'package:news_test/presentation/screens/science_screen.dart';
import 'package:news_test/presentation/screens/setting_screen.dart';
import 'package:news_test/presentation/screens/sport_screen.dart';

class NewsCubit extends Cubit<NewsState>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit  git(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<Widget>screens=[

    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreen()
  ];

  void changeIndex(index){
    currentIndex=index;
    emit(NewsChangeIndex());
  }

  List <dynamic> business =[];


  void getBusiness(){
    emit(NewsGetBusinessLoadingsState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value){

      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
      print(value.data['articles']);
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List <dynamic> sport =[];


  void getSport(){
    emit(NewsGetSportLoadingsState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sport',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value){

      sport = value.data['articles'];
      emit(NewsGetSportSuccessState());
      print(value.data['articles']);
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportErrorState(error.toString()));
    });
  }

  List <dynamic> science =[];


  void getScience(){
    emit(NewsGetScienceLoadingsState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value){

      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
      print(value.data['articles']);
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  bool darkMode =false;


  void isDarkMode(){
    darkMode =! darkMode;
    emit(NewsIsDarkModeState());
  }



}