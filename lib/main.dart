import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portable_portfolio/dependencies.dart';
import 'package:theem_managing/pages/main_page/main_page.dart';
import 'package:developers_theme/config/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAjM_gLTFNXEH2DMIOxl2GkoCM-jyNiPck",
        appId: "1:554361699506:web:cb35986ea614f25711ddab",
        messagingSenderId: "554361699506",
        projectId: "portable-portfolio"),
  );
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.yellow),
      ),
      getPages: [
        GetPage(name: MainPage.pageName, page:()=> const MainPage())
      ],
      home: FutureBuilder(
        future: _initialization,
        builder: (_ , snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasError){
            return Scaffold(
              body: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }
          initDependencies();
          return const MainPage();
        },
      ),
    );
  }
}
