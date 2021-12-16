import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portable_portfolio/collections.dart';
import 'package:theem_managing/logic/datasource.dart';

class ThemeManagingDataSourceImp implements ThemeManagingDataSource{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String themeName = "";

  @override
  Future<String> getCurrentThemeName() async {

    if (themeName != ""){
      return themeName;
    }

    var query = await _firestore.collection(CONFIGS).doc("1").get();

    themeName = query.data()!["themeName"];
    return query.exists ? query.data()!["themeName"] : "";
  }

}