import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test/business_logic/cubit/cubit.dart';
import 'package:news_test/business_logic/cubit/states.dart';
import 'package:news_test/presentation/widget/custom_widget.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsState>(
          listener: (context,state){},
            builder: (context,state){
            var businessList = NewsCubit.git(context).business;
            return ConditionalBuilder(
                condition: state is! NewsGetBusinessLoadingsState,
                builder: (context)=>ListView.separated(
                    itemBuilder: (context,index)=>buildItem(businessList[index],context),
                    separatorBuilder: (context,index)=> Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    itemCount: 10),
              fallback:(context)=>Center(child: CircularProgressIndicator()) ,
            );
            },


    );
  }
}
