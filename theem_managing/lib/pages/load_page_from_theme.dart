import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theem_managing/logic/controller.dart';
import 'package:developers_theme/developers_theme.dart' as developers_theme;
import 'package:theem_managing/pages/main_page/main_page.dart';

class LoadPageFromTheme extends StatefulWidget {
  final Widget page;

  const LoadPageFromTheme({Key? key , required this.page}) : super(key: key);

  @override
  State<LoadPageFromTheme> createState() => _LoadPageFromThemeState();
}

class _LoadPageFromThemeState extends State<LoadPageFromTheme> {
  final ThemeController _controller = Get.find();

  @override
  void initState() {
    super.initState();

    _controller.getThemeName();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      var viewState = _controller.viewState.value;
      if (viewState.loading){
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (viewState.error != ""){
        return Scaffold(
          body: Center(
            child:  Text(viewState.error),
          ),
        );
      }

      if (viewState.themeName != ""){
        return themesMapping(viewState.themeName);
      }
      return Container();
    });
  }

  Widget themesMapping(String themeName){
    switch(themeName){
      case developers_theme.THEME_NAME : {
        if (widget.page is MainPage){
          return const developers_theme.Home();
        } else {
          throw "Not found page";
        }
      }
      default :{
        throw "Not fount theme";
      }
    }
  }
}

