// import 'package:dartz/dartz.dart';
// import 'package:flutter_news/features/news_api/domain/entities/article.dart';
// import 'package:flutter_news/features/news_api/domain/entities/new.dart';
// import 'package:flutter_news/features/news_api/domain/repositories/new_repository.dart';
// import 'package:flutter_news/features/news_api/domain/uses_cases/get_concrete_new_everything.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockNewEverythingRepository extends Mock implements NewRepository {}

// void main() {
//   GetConcreteNewEverything? usecase;
//   MockNewEverythingRepository? mockNewEverythingRepository;
//   setUp(
//     () {
//       mockNewEverythingRepository = MockNewEverythingRepository();
//       usecase = GetConcreteNewEverything(mockNewEverythingRepository!);
//     },
//   );

//   const tQ = 'Papa';
//   const tlanguage = 'fr';
//   const tfrom = '2022-10-11';
//   final tNew = New(articles: [
//     Article(
//         author: 'test Author',
//         content: 'test content',
//         description: 'description',
//         title: 'test title',
//         urlToImage: 'urlToImage')
//   ], totalResults: 1);

//   test(
//     'should get new for the keyword from the repository',
//     () async {
//     // arrange
//     when(mockNewEverythingRepository!.getConcreteNewEverything(
//             tQ, tlanguage, tlanguage))
//         .thenAnswer((_) async => Right(tNew));
//     // act
//     final result =
//         await usecase!.execute(q: tQ, language: tlanguage, from: tfrom);
//     // assert
//     expect(result, Right(tNew));
//     verify(mockNewEverythingRepository!.getConcreteNewEverything(
//         tQ, tlanguage, tfrom));
//     verifyNoMoreInteractions(mockNewEverythingRepository);
//   });
// }