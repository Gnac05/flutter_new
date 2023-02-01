import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/config/constant.dart';
import 'package:flutter_news/core/config/di.dart';
import 'package:flutter_news/core/model/app_model.dart';
import 'package:flutter_news/features/news_api/presentation/blocs/blocEverything/everything_bloc.dart';
import 'package:flutter_news/features/news_api/presentation/blocs/blocSortEverything/sort_everything_bloc.dart';

import '../blocs/blocSortTopHeadlines/sort_top_headlines_bloc.dart';
import '../blocs/blocTopHeadlines/top_headlines_bloc.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {Key? key, required this.controller, required this.type})
      : super(key: key);
  final TextEditingController controller;
  final FieldType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onSaved: (value) {
        switch (type) {
          case FieldType.everything:
            context.read<SortEverythingQBloc>().add(EverythingQ(text: value!));
            // context.read<EverythingBloc>().add( BlocEventEverything(getIt<AppModel>().getEverythingQ(), languages[getIt<AppModel>().getLanguage()?? 0], getIt<AppModel>().getFrom()));
            break;
          case FieldType.topHeadlines:
            context.read<SortTopHeadlinesQBloc>().add(TopHeadlinesQ(text: value!));
            break;  
          default:
        }
        // return '';
      },
      onChanged: (value) {
        print("#####-----$value");
        switch (type) {
          case FieldType.everything:
            // context.read<SortEverythingQBloc>().add(EverythingQ(text: value));
            context.read<EverythingBloc>().add(BlocEventEverything(
                value,
                languages[getIt<AppModel>().getLanguage() ?? 0],
                getIt<AppModel>().getFrom()));
            break;
          case FieldType.topHeadlines:
            context.read<TopHeadlinesBloc>().add(BlocEventTopHeadlines(
                value,
                categories[getIt<AppModel>().getCategory() ?? 0],
                countries[getIt<AppModel>().getCountry() ?? 0]));
            break;   
          default:
        }
        // return 'no';
      },
      decoration: const InputDecoration(
          suffixIcon: Icon(Icons.newspaper_rounded),
          label: Text("Mot ou Phrase",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 13)),
          border: OutlineInputBorder()),
    );
  }
}
