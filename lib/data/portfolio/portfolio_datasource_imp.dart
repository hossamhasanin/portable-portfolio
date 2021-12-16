import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logic/models/portfolio_main_data.dart';
import 'package:logic/models/project.dart';
import 'package:logic/models/skill.dart';
import 'package:logic/portifolio_datasource.dart';
import 'package:portable_portfolio/collections.dart';

class PortfolioDataSourceImp implements PortfolioDataSource{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<PortfolioMainData> getPortfolioMainData() async {
    var query = await _firestore.collection(MAIN_DATA).doc("1").get();

    return query.exists ? PortfolioMainData.fromMap(query.data()!) : PortfolioMainData.notAssigned();
  }

  @override
  Future<List<Skill>> getSkills() async {
    var query = await _firestore.collection(SKILLS).get();

    return query.size > 0 ? query.docs.map((doc) => Skill.fromMap(doc.data())).toList() : [];
  }

  @override
  Future<List<Project>> getProjects() async {
    var query = await _firestore.collection(PROJECTS).get();

    print("projects "+query.docs.map((doc) => Project.formMap(doc.data())).toList().toString());
    return query.size > 0 ? query.docs.map((doc) => Project.formMap(doc.data())).toList() : [];
  }

}