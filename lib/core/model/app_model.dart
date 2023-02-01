import 'package:flutter/cupertino.dart';
import 'package:flutter_news/core/config/constant.dart';

class AppModel {
  String? qEverything = 'Bénin';
  String? from;
  String? language;

  // int languageValue = 0;
  Future<void> setLanguage(int newLanguage) async{
    await pref!.setInt('language', newLanguage);
  }

  int? getLanguage() {
    return pref!.getInt('language');
  }

Future<void> setCountry(int newCountry) async{
    await pref!.setInt('country', newCountry);
  }

  int? getCountry() {
    return pref!.getInt('country');
  }

  Future<void> setCategory(int newCategory) async{
    await pref!.setInt('category', newCategory);
  }

  int? getCategory() {
    return pref!.getInt('category');
  }

  Future<void> setEverythingQ(String q) async{
    await pref!.setString('everythingQ', q);
  }

  String? getEverythingQ(){
    return pref!.getString('everythingQ');
  }

  Future<void> setTopHeadlinesQ(String q) async{
    await pref!.setString('topHeadlinesQ', q);
  }

  String? getTopHeadlinesQ(){
    return pref!.getString('topHeadlinesQ');
  }

  Future<void> setFrom(String from) async{
    await pref!.setString('from', from);
  }

  String? getFrom(){
    return pref!.getString('from');
  }

  TextEditingController text2Contoller(String text){
    TextEditingController controller = TextEditingController();
    controller.text = text;
    return controller;
  }
//   void setQEverything(String newValue) {
//     qEverything = newValue;
//   }

//   void setFrom(String newValue) {
//     from = newValue;
//   }

//   void setLanguage(String newValue) {
//     language = newValue;
//   }

// void setLanguageValue(int newValue) {
//     languageValue = newValue;
//   }

//   void loadedEvent(BuildContext context){
//     context.read<EverythingBloc>().add(BlocEventEverything(qEverything, language, from));
//   }
}
