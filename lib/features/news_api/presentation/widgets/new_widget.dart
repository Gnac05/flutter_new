import 'package:flutter/material.dart';
import 'package:flutter_news/features/news_api/domain/entities/new.dart';
import 'package:flutter_news/features/news_api/presentation/widgets/article_widget.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key, required this.newApi}) : super(key: key);
  final New newApi;
  @override
  Widget build(BuildContext context) {
    return newApi.message != null
        ?Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(newApi.message!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 15)),
            ),
          ): SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Exactement : ${newApi.totalResults} Résultat trouvé',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Column(
                  children: List<Widget>.generate(
                    // l'api n'envoi pas de bonne valeur pour qu'on puisse mettre totalResultats
                    newApi.articles!.length,
                    (index) => ArticleWidget(article: newApi.articles![index]),
                  ),
                )
              ],
            ),
          )
        ;
  }
}
