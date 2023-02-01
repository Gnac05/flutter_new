import 'package:flutter/material.dart';
import 'package:flutter_news/core/config/constant.dart';
import 'package:flutter_news/core/config/di.dart' as di;
import 'package:flutter_news/features/news_api/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  controllerEverything.text = 'Bénin';
  pref = await SharedPreferences.getInstance();
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.red,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.black,
              onPrimary: Colors.green,
              secondary: Colors.yellow,
              onSecondary: Colors.red,
              error: Colors.black,
              onError: Colors.white,
              background: Colors.pink,
              onBackground: Colors.purple,
              surface: Colors.white,
              onSurface: Colors.green)
          // colorScheme: const ColorScheme(brightness: Brightness.dark, primary: Colors.green, onPrimary: Colors.greenAccent, secondary: Colors.yellow, onSecondary: Colors.red, error: Colors.black, onError: Colors.white, background: Colors.pink, onBackground: Colors.purple, surface: Colors.lime, onSurface: Colors.deepOrange)
          ),
      home: const HomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
