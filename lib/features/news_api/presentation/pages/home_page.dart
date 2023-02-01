import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/config/di.dart';
import 'package:flutter_news/features/news_api/presentation/blocs/blocSortEverything/sort_everything_bloc.dart';

import '../blocs/blocEverything/everything_bloc.dart';
import '../blocs/blocSortTopHeadlines/sort_top_headlines_bloc.dart';
import '../blocs/blocTopHeadlines/top_headlines_bloc.dart';
import 'everything_page.dart';
import 'top_headlines_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Gnac News'),
          actions: [
            IconButton(
                onPressed: () {
                  // showBottomSheet(
                  //   context: context,
                  //   builder: (context) => const AboutPage(),
                  // );
                },
                icon: const Icon(Icons.info_outline))
          ],
        ),
        body: Column(
          children: [
            const Expanded(
                child: TabBar(
              tabs: [
                Tab(
                  text: "Tous",
                ),
                Tab(
                  text: "Gros Titre",
                )
              ],
            )),
            Expanded(
                flex: 10,
                child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => SortEverythingFromBloc(),
                          ),
                          BlocProvider(
                            create: (context) => SortEverythingQBloc(),
                          ),
                          BlocProvider(
                              create: (context) =>
                                  SortEverythingLanguageBloc()),
                          BlocProvider(
                            create: (_) => getIt<EverythingBloc>(),
                          )
                        ],
                        child: const EverythingPage(),
                      ),
                      MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => SortTopHeadlinesCountryBloc(),
                          ),
                          BlocProvider(
                            create: (context) => SortTopHeadlinesQBloc(),
                          ),
                          BlocProvider(
                              create: (context) =>
                                  SortTopHeadlinesCategoryBloc()),
                          BlocProvider(
                            create: (_) => getIt<TopHeadlinesBloc>(),
                          )
                        ],
                        child: const TopHeadlinesPage(),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
