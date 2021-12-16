import 'package:logic/models/portfolio_main_data.dart';
import 'package:logic/models/project.dart';
import 'package:logic/models/skill.dart';

abstract class PortfolioDataSource{
  Future<PortfolioMainData> getPortfolioMainData();
  Future<List<Skill>> getSkills();
  Future<List<Project>> getProjects();
}