import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_test/business_logic/cubit/cubit.dart';
import 'package:news_test/business_logic/cubit/states.dart';
import 'package:news_test/presentation/screens/business_screen.dart';
import 'package:news_test/presentation/screens/science_screen.dart';
import 'package:news_test/presentation/screens/setting_screen.dart';
import 'package:news_test/presentation/screens/sport_screen.dart';

import 'component/shared_bloc_observer.dart';
import 'data/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.git(context);
          return MaterialApp(
            theme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  )
              ),
              appBarTheme: AppBarTheme(

                  actionsIconTheme: IconThemeData(
                      color: Colors.black
                  ),
                  textTheme: TextTheme(

                  ),

                  color: Colors.white
              ),
              primarySwatch: Colors.teal,
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.teal,
                  type: BottomNavigationBarType.fixed

              ) ,

            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              ),
              appBarTheme: AppBarTheme(
                  color: HexColor('333739'),
                  elevation: 0.0,
                  actionsIconTheme: IconThemeData(
                    color: Colors.white,

                  )

              ),
              primarySwatch: Colors.teal,
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                  backgroundColor: HexColor('333739'),
                  selectedItemColor: Colors.teal,
                  type: BottomNavigationBarType.fixed,
                  elevation: 20,
                  unselectedItemColor: Colors.grey

              ),

              scaffoldBackgroundColor: HexColor('333739'),


            ),
            themeMode: cubit.darkMode ? ThemeMode.dark :ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: BlocProvider(
              create: (context)=>NewsCubit()..getBusiness()..getSport()..getScience(),
              child: BlocConsumer<NewsCubit,NewsState>(
                listener:(context,state){} ,
                builder: (context,state){

                  return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      title: Text("NewsApp",style: Theme.of(context).textTheme.bodyText1,),
                      actions: [
                        Icon(Icons.search,),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(icon: Icon(Icons.brightness_4_outlined),
                          onPressed: (){
                            cubit.isDarkMode();
                        },),


                      ],
                    ),
                    body: cubit.screens[cubit.currentIndex],
                    bottomNavigationBar: BottomNavigationBar(
                      currentIndex: cubit.currentIndex,
                      onTap: (index){
                        cubit.changeIndex(index);
//                  setState(() {
//                    this.index=index;
//                  });
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.business),
                          label: 'business',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.sports),
                          label: 'sports',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.science),
                          label: 'science',
                        ),

                      ],
                    ),

                  );
                },

              ),
            ),
          );
        },

      ),
    );
  }
}

