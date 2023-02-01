import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/features/news_api/domain/entities/article.dart';
import 'package:flutter_news/features/news_api/presentation/widgets/article_page_widget.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 15),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlePageWidget(article: article),)),
        child: Container(
          width: double.infinity,
          // height: 150,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: article.urlToImage??'https://demofree.sirv.com/nope-not-here.jpg',
                fit: BoxFit.fill,
                height: double.infinity,
                width: 120,
                placeholder: (context, url) => const Icon(
                  Icons.image,
                  size: 60,
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                  size: 60,
                ),
              ),
              title: Text(article.title?? 'Sans Title', 
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              subtitle: Text(article.description?? 'Sans Description',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
