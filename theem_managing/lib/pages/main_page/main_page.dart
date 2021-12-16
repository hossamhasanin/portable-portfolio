import 'package:flutter/material.dart';
import 'package:theem_managing/pages/load_page_from_theme.dart';

class MainPage extends StatelessWidget {
  static String pageName = "/mainPage";
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadPageFromTheme(page: this,);
  }
}