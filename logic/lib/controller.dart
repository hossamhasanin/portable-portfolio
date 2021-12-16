import 'package:get/get.dart';
import 'package:logic/portifolio_datasource.dart';
import 'package:logic/usecase.dart';
import 'package:logic/viewstate.dart';

class PortfolioController extends GetxController{
  final Rx<PortfolioViewState> viewState = PortfolioViewState.init().obs;
  late final PortfolioUseCase _useCase;

  PortfolioController(PortfolioDataSource dataSource){
    _useCase = PortfolioUseCase(dataSource);
  }

  Future loadData() async{
    viewState.value = viewState.value.copy(loading: true);
    await _getMainData();
    await _getSkills();
    await _getProjects();
    viewState.value = viewState.value.copy(loading: false);
  }

  Future _getMainData() async{
    viewState.value = await _useCase.getMainData(viewState.value);
  }

  Future _getSkills() async{
    viewState.value = await _useCase.getSkills(viewState.value);
  }

  Future _getProjects() async{
    viewState.value = await _useCase.getProjects(viewState.value);
    print("projects "+viewState.value.projects.toString());
  }
}