import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/config/di.dart';
import '../../../../core/model/app_model.dart';
import '../blocs/blocSortTopHeadlines/sort_top_headlines_bloc.dart';
import '../blocs/blocTopHeadlines/top_headlines_bloc.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/fade_ui.dart';
import '../widgets/my_text_form_field.dart';
import '../widgets/new_widget.dart';

class TopHeadlinesPage extends StatelessWidget {
  const TopHeadlinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // En tête de spécialisation de recherche de New
          Padding(
            padding:
                const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 4),
            child: SizedBox(
              height: 125,
              child: Column(
                children: [
                  BlocBuilder<SortTopHeadlinesQBloc, SortTopHeadlinesState>(
                    builder: (context, state) {
                      if (state is SortTopHeadlinesInitialQ) {
                        return MyTextFormField(
                            controller: state.controller,
                            type: FieldType.topHeadlines);
                      }
                      if (state is SortTopHeadlinesReadyQ) {
                        return MyTextFormField(
                            controller: state.controller,
                            type: FieldType.topHeadlines);
                      }
                      return Container();
                    },
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: BlocBuilder<SortTopHeadlinesCountryBloc,
                                    SortTopHeadlinesState>(
                                  builder: (context, state) {
                                    print(state);
                                    if (state
                                        is SortTopHeadlinesInitialCountry) {
                                      return DropdownWidget(
                                          value: state.countryIndex,
                                          list: countries,
                                          dropType: DropType.country);
                                    }
                                    if (state is SortTopHeadlinesReadyCountry) {
                                      return DropdownWidget(
                                          value: state.countryIndex,
                                          list: countries,
                                          dropType: DropType.country);
                                    }
                                    return Container();
                                  },
                                ),
                              ),
                            )),

                            Expanded(flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: BlocBuilder<SortTopHeadlinesCategoryBloc,
                                    SortTopHeadlinesState>(
                                  builder: (context, state) {
                                    print(state);
                                    if (state
                                        is SortTopHeadlinesInitialCategory) {
                                      return DropdownWidget(
                                          value: state.categoryIndex,
                                          list: categories,
                                          dropType: DropType.category);
                                    }
                                    if (state is SortTopHeadlinesReadyCategory) {
                                      return DropdownWidget(
                                          value: state.categoryIndex,
                                          list: categories,
                                          dropType: DropType.category);
                                    }
                                    return Container();
                                  },
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // New starting
          BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
            builder: (context, state) {
              print(state.toString());
              if (state is TopHeadlinesInitial) {
                ///[Initialisation de l'élément sauvegardé]
                context.read<TopHeadlinesBloc>().add(BlocEventTopHeadlines(
                    getIt<AppModel>().getTopHeadlinesQ() ?? '',
                    categories[getIt<AppModel>().getCategory() ?? 0],
                    countries[getIt<AppModel>().getCountry() ?? 0]));

                return const FadeUi();
              }
              if (state is TopHeadlinesLoading) {
                return const FadeUi();
              }
              if (state is TopHeadlinesError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is TopHeadlinesReady) {
                return NewWidget(newApi: state.newApi);
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
