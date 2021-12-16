import 'package:get/get.dart';
import 'package:logic/controller.dart';
import 'package:logic/models/portfolio_main_data.dart';
import 'package:logic/portifolio_datasource.dart';
import 'package:portable_portfolio/data/portfolio/portfolio_datasource_imp.dart';
import 'package:portable_portfolio/data/theme_managing/theme_managing_datasource_imp.dart';
import 'package:theem_managing/logic/controller.dart';
import 'package:theem_managing/logic/datasource.dart';

initDependencies(){
  Get.put<ThemeManagingDataSource>(ThemeManagingDataSourceImp());
  Get.put<PortfolioDataSource>(PortfolioDataSourceImp());
  Get.put(ThemeController(Get.find()));
  Get.put(PortfolioController(Get.find()));
}