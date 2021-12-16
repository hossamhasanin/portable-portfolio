import 'package:get/get.dart';
import 'package:theem_managing/logic/datasource.dart';
import 'package:theem_managing/logic/usecase.dart';
import 'package:theem_managing/logic/viewstate.dart';

class ThemeController extends GetxController{

  Rx<ThemeManageViewState> viewState = ThemeManageViewState.init().obs;

  late final ThemeUseCase _useCase;

  ThemeController(ThemeManagingDataSource dataSource){
    _useCase = ThemeUseCase(dataSource);
  }

  Future getThemeName()async{
    viewState.value = await _useCase.getThemeName(viewState.value);
  }

}