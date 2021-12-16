import 'package:equatable/equatable.dart';

class PortfolioMainData extends Equatable{
  final String ownerName;
  final String email;
  final String phone;
  final String ownerImage;
  final String career;
  final String description;
  final String cvUrl;
  final String facebookAccount;
  final String githubAccount;
  final String linkedinAccount;
  final String twitterAccount;
  final int yearsOfExperience;

  PortfolioMainData({
    required this.ownerName,
    required this.career,
    required this.description,
    required this.yearsOfExperience,
    required this.ownerImage,
    required this.cvUrl,
    required this.email,
    required this.phone,
    required this.facebookAccount,
    required this.linkedinAccount,
    required this.twitterAccount,
    required this.githubAccount,
  });

  factory PortfolioMainData.init(){
    return PortfolioMainData(
        ownerName: "",
        career: "",
        email: "",
        phone: "",
        description: "",
        ownerImage: "",
        yearsOfExperience: 0,
        cvUrl: "",
        twitterAccount: "",
        linkedinAccount: "",
        githubAccount: "",
        facebookAccount: "",
    );
  }

  factory PortfolioMainData.notAssigned(){
    return PortfolioMainData(
        ownerName: "Not assigned",
        career: "Not assigned",
        description: "Not assigned",
        ownerImage: "",
        yearsOfExperience: 0,
        cvUrl: "",
        email: "",
        phone: "",
        twitterAccount: "",
        linkedinAccount: "",
        githubAccount: "",
        facebookAccount: "",
    );
  }

  static PortfolioMainData fromMap(Map<String , dynamic> map){
    return PortfolioMainData(
        ownerName: map["ownerName"] ?? "",
        ownerImage: map["ownerImage"] ?? "",
        career: map["career"] ?? "",
        description: map["description"] ?? "",
        yearsOfExperience: map["yearsOfExperience"] ?? 0,
        cvUrl: map["cvUrl"] ?? "",
        email: map["email"] ?? "",
        phone: map["phone"] ?? "",
        twitterAccount: map["twitterAccount"] ?? "",
        linkedinAccount: map["linkedinAccount"] ?? "",
        githubAccount: map["githubAccount"] ?? "",
        facebookAccount: map["facebookAccount"] ?? "",
    );
  }

  @override
  List<Object?> get props => [
    ownerName,
    career,
    description,
    yearsOfExperience,
    cvUrl,
    email,
    phone,
    twitterAccount,
    facebookAccount,
    linkedinAccount,
    githubAccount
  ];
}