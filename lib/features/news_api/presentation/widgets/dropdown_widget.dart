import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/config/constant.dart';
import 'package:flutter_news/features/news_api/presentation/blocs/blocSortEverything/sort_everything_bloc.dart';

import '../../../../core/config/di.dart';
import '../../../../core/model/app_model.dart';
import '../blocs/blocEverything/everything_bloc.dart';
import '../blocs/blocSortTopHeadlines/sort_top_headlines_bloc.dart';
import '../blocs/blocTopHeadlines/top_headlines_bloc.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {Key? key,
      required this.value,
      required this.list,
      required this.dropType})
      : super(key: key);
  final int value;
  final List<String> list;
  final DropType dropType;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Text('${dropType.name.toString()} : '),
          DropdownButton<int>(
            value: value, // il faut utiliser bloc pour le faire
            items: List.generate(
                list.length,
                (index) => DropdownMenuItem(
                  onTap: () {
                    switch (dropType) {
                case DropType.langauge:
                  context
                      .read<SortEverythingLanguageBloc>()
                      .add(EverythingLanguage(languageIndex: index));
                  break;
                case DropType.category:
                  context
                      .read<SortTopHeadlinesCategoryBloc>()
                      .add(TopHeadlinesCategory(categoryIndex: index));
                  break;
                case DropType.country:
                  context
                      .read<SortTopHeadlinesCountryBloc>()
                      .add(TopHeadlinesCountry(countryIndex: index));
                  break;    
                default:
              }
                  },
                      value: index,
                      child: Text(list[index]),
                    )),
            onChanged: (value) {
              switch (dropType) {
                case DropType.langauge:
                  context.read<SortEverythingLanguageBloc>().add(EverythingLanguage(languageIndex: value!));
                  context.read<EverythingBloc>().add( BlocEventEverything(getIt<AppModel>().getEverythingQ()??'Bénin', languages[value], getIt<AppModel>().getFrom()));
                  break;
                case DropType.category:
                  context.read<SortTopHeadlinesCategoryBloc>().add(TopHeadlinesCategory(categoryIndex: value!));
                  context.read<TopHeadlinesBloc>().add( BlocEventTopHeadlines(getIt<AppModel>().getTopHeadlinesQ(), categories[value], countries[getIt<AppModel>().getCountry()??0]));
                  break;
                case DropType.country:
                  context.read<SortTopHeadlinesCountryBloc>().add(TopHeadlinesCountry(countryIndex: value!));
                  context.read<TopHeadlinesBloc>().add( BlocEventTopHeadlines(getIt<AppModel>().getTopHeadlinesQ(), categories[getIt<AppModel>().getCategory()??0], countries[value]));
                  break;    
                default:
              }
            },
          ),
        ],
      ),
    );
  }
}
