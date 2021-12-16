import 'package:theem_managing/logic/datasource.dart';
import 'package:theem_managing/logic/viewstate.dart';

class ThemeUseCase{

  final ThemeManagingDataSource _dataSource;

  ThemeUseCase(this._dataSource);


  Future<ThemeManageViewState> getThemeName(ThemeManageViewState viewState) async{
    try{
      var name = await _dataSource.getCurrentThemeName();
      return viewState.copy(loading: false , error: ""  , themeName: name);
    } catch(e){
      return viewState.copy(error: e.toString() , loading: false , themeName: "");
    }
  }



}