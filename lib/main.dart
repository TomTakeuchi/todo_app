import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/models/task_data.dart';
import 'package:fluttertodo/screens/task_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //画面を縦に固定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //provider TaskData()を管理
      create: (context) => TaskData(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF111328),
            accentColor: Colors.green,
          ),
          home: TaskScreen(),
          routes: <String, WidgetBuilder>{
            '/taskScreen': (BuildContext context) => new TaskScreen(),
          }),
    );
  }
}
