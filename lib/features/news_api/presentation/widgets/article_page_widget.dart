import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/features/news_api/domain/entities/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePageWidget extends StatelessWidget {
  const ArticlePageWidget({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            // centerTitle: true,
            // title: Text(article.title?? 'Sans Title',
            //     overflow: TextOverflow.ellipsis,
            //     style:
            //         const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            expandedHeight: 300,
            floating: true,
            snap: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(article.title?? 'Sans Title',
              //   style:
              //       const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              background: CachedNetworkImage(
                  imageUrl: article.urlToImage??'https://demofree.sirv.com/nope-not-here.jpg',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                        color: Colors.white24,
                      ),
                  errorWidget: (context, url, error) => Container(
                        color: Colors.pink,
                      )),
            ),
          )
        ],
          
        body:  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(article.title?? 'Sans Title',
                  style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(article.description?? 'Sans Description',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    )),
                ),

                  Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(article.content?? 'Sans Contenu',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 12,
                    )),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextButton(
                    onPressed: () {
                      String urlError = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8B59MIj8-aiRlaqGqYlTieHSy0FxQn5LMVA&usqp=CAU';
                      // Uri url = Uri.parse(article.url ?? urlError);
                      // launchUrl(url);
                      if(Platform.isAndroid) WebView.platform = AndroidWebView();
                      // if(Platform.isIOS) WebView.platform = ?????;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SafeArea(child: WebView(initialUrl: article.url ?? urlError)) ,) );
                    },
                    child:const Text('Voir Plus',
                      textAlign: TextAlign.center,
                      
                      style:  TextStyle(
                        fontSize: 12,color: Colors.green
                      )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Write by ${article.author} \nSource${article.source!.name!} \nUrl${article.url}',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    )),
                ),
              ],
            ),
          )
        
      ),
    );
  }
}
