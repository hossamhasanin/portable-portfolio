import 'package:logic/portifolio_datasource.dart';
import 'package:logic/viewstate.dart';

class PortfolioUseCase{
  final PortfolioDataSource _dataSource;

  PortfolioUseCase(this._dataSource);

  Future<PortfolioViewState> getMainData(PortfolioViewState viewState) async {
    try{
      var mainData = await _dataSource.getPortfolioMainData();
      return viewState.copy(portfolioMainData: mainData ,error: "");
    }catch(e){
      return viewState.copy(loading: false , error: e.toString());
    }
  }

  Future<PortfolioViewState> getSkills(PortfolioViewState viewState) async {
    try{
      var skills = await _dataSource.getSkills();
      return viewState.copy(skills: skills);
    }catch(e){
      return viewState.copy(loading: false , error: e.toString());
    }
  }

  Future<PortfolioViewState> getProjects(PortfolioViewState viewState) async {
    try{
      var projects = await _dataSource.getProjects();
      return viewState.copy(projects: projects);
    }catch(e){
      return viewState.copy(loading: false , error: e.toString());
    }
  }

}