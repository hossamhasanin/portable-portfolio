import 'package:logic/models/portfolio_main_data.dart';
import 'package:logic/models/skill.dart';

import 'models/project.dart';

class PortfolioViewState{
  final PortfolioMainData portfolioMainData;
  final List<Skill> skills;
  final List<Project> projects;
  final bool loading;
  final String error;

  PortfolioViewState({
    required this.error,
    required this.portfolioMainData,
    required this.skills,
    required this.loading,
    required this.projects
  });

  factory PortfolioViewState.init(){
    return PortfolioViewState(
        error: "",
        portfolioMainData: PortfolioMainData.init(),
        skills: [],
        loading: false,
        projects: []
    );
  }

  PortfolioViewState copy({
    String? error,
    PortfolioMainData? portfolioMainData,
    List<Skill>? skills,
    List<Project>? projects,
    bool? loading
  }){
    return PortfolioViewState(
        error: error ?? this.error,
        portfolioMainData: portfolioMainData ?? this.portfolioMainData,
        skills: skills ?? this.skills,
        projects: projects ?? this.projects,
        loading: loading ?? this.loading
    );
  }
}