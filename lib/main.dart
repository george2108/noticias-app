import 'package:flutter/material.dart';
import 'package:noticiasapp/src/pages/home_page.dart';
import 'package:noticiasapp/src/services/news_service.dart';
import 'package:noticiasapp/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: customDarkTheme,
        home: HomePage(),
      ),
    );
  }
}
