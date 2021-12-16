import 'package:equatable/equatable.dart';

class Skill extends Equatable{
  final String id;
  final String name;

  const Skill({required this.id,required this.name});

  factory Skill.init(){
    return const Skill(id: "", name: "");
  }

  @override
  List<Object?> get props => [id , name];

  static Skill fromMap(Map<String , dynamic> map){
    return  Skill(id: map["id"], name: map["name"]);
  }
}