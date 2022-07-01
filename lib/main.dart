import 'package:flutter/material.dart';
import 'package:grocery_app/const/theme_data.dart';
import 'package:grocery_app/provider/theme_%20dark_provider.dart';
import 'package:grocery_app/services/user.dart';
import 'package:provider/provider.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefes.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const UserScreen(),
        );
      }),
    );
  }
}
