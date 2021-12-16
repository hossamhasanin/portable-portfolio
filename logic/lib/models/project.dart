import 'package:equatable/equatable.dart';

class Project extends Equatable{
  final String id;
  final String name;
  final String description;
  final String img;
  final String url;
  final List<String> skills;

  const Project({
    required this.id,
    required this.name,
    required this.description,
    required this.img,
    required this.url,
    required this.skills
  });


  @override
  List<Object?> get props => [
    id,
    name,
    description,
    img,
    url,
    skills
  ];

  static Project formMap(Map<String , dynamic> map){
    return Project(
        id: map["id"],
        name: map["title"],
        description: map["description"],
        img: map["image"],
        url: map["url"],
        skills: (map["skills"] as List<dynamic>).cast<String>(),
    );
  }

}