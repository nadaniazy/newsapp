import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/busineslogic/state.dart';
import 'package:newsapp/network/dio.dart';
import 'package:newsapp/network/endpoint.dart';

import '../models/newsmodel.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() :super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<ArticleModel> articles =[];
  Future getnews()async {
    emit(getLoadingState());
   await DioHelper.getData(endPoint: endpoint,query: {
     'country':'us',
     'apiKey':'ab3b6086568c4c00ad6c843bf2aa2cf5'
   }).then((value) {
     value.data['articles'].forEach((element)
     {
       articles.add(ArticleModel.fromJson(element));
     });
      emit(getSuccessState());
    }).catchError((e) {
      emit(getErrorState(e.toString()));
      print(e.toString());
    });
  }
  bool check=false;
  void swap(){
    check=!check;
    emit(swapSuccessState());
  }
  TextEditingController searchcontroller = TextEditingController();
void cleartextformfield(){
    searchcontroller.clear();
    emit(clearSuccessState());
}
}