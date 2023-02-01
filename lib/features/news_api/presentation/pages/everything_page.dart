import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/config/constant.dart';
import 'package:flutter_news/core/config/di.dart';
import 'package:flutter_news/core/model/app_model.dart';
import 'package:flutter_news/features/news_api/presentation/blocs/blocSortEverything/sort_everything_bloc.dart';
import 'package:flutter_news/features/news_api/presentation/widgets/dropdown_widget.dart';
import 'package:flutter_news/features/news_api/presentation/widgets/fade_ui.dart';
import 'package:flutter_news/features/news_api/presentation/widgets/my_text_form_field.dart';
import 'package:flutter_news/features/news_api/presentation/widgets/picke_date.dart';

import '../blocs/blocEverything/everything_bloc.dart';
import '../widgets/new_widget.dart';

class EverythingPage extends StatelessWidget {
  const EverythingPage({Key? key}) : super(key: key);

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
                  BlocBuilder<SortEverythingQBloc, SortEverythingState>(
                    builder: (context, state) {
                      if (state is SortEverythingInitialQ) {
                        return MyTextFormField(
                            controller: state.controller,
                            type: FieldType.everything);
                      }
                      if (state is SortEverythingReadyQ) {
                        return MyTextFormField(
                            controller: state.controller,
                            type: FieldType.everything);
                      }
                      return Container();
                    },
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BlocBuilder<SortEverythingFromBloc,
                                SortEverythingState>(
                              builder: (context, state) {
                                if (state is SortEverythingInitialFrom) {
                                  return PickeDate(from: state.from);
                                }
                                if (state is SortEverythingReadyFrom) {
                                  return PickeDate(from: state.from);
                                }
                                return Container();
                              },
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: BlocBuilder<SortEverythingLanguageBloc,
                                    SortEverythingState>(
                                  builder: (context, state) {
                                    print(state);
                                    if (state
                                        is SortEverythingInitialLanguage) {
                                      return DropdownWidget(
                                          value: state.languageIndex,
                                          list: languages,
                                          dropType: DropType.langauge);
                                    }
                                    if (state is SortEverythingReadyLanguage) {
                                      return DropdownWidget(
                                          value: state.languageIndex,
                                          list: languages,
                                          dropType: DropType.langauge);
                                    }
                                    return Container();
                                  },
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // New starting
          BlocBuilder<EverythingBloc, EverythingState>(
            builder: (context, state) {
              print(state.toString());
              if (state is EverythingInitial) {
                ///[Initialisation de élément sauvegardé]
                context.read<EverythingBloc>().add(BlocEventEverything(
                    getIt<AppModel>().getEverythingQ() ?? 'Bénin',
                    languages[getIt<AppModel>().getLanguage() ?? 0],
                    getIt<AppModel>().getFrom()));

                return const FadeUi();
              }
              if (state is EverythingLoading) {
                return const FadeUi();
              }
              if (state is EverythingError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is EverythingReady) {
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
