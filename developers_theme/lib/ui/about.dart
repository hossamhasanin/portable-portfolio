import 'package:flutter/material.dart';
import 'package:logic/models/skill.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class About extends StatelessWidget {
  final String ownerImage;
  final String description;
  final String cvUrl;
  final List<Skill> skills;

  const About({Key? key,
    required this.ownerImage,
    required this.description,
    required this.skills,
    required this.cvUrl
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: 100,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      color: AppColors.greyLight,
                      child: Image(image: NetworkImage(
                        ownerImage,
                      ),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABOUT ME',
                          style: TextStyle(
                            color: AppColors.yellow,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: Colors.black.withOpacity(.7),
                                fontSize: 17,
                              ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.yellow,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                              ),
                              child: const Text('HIRE ME NOW' , style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: (){
                                launch(cvUrl);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                              ),
                              child: const Text('VIEW RESUME' , style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 100, height: 2, color: AppColors.yellow),
              const SizedBox(height: 3),
              Container(width: 75, height: 2, color: AppColors.yellow),
              const SizedBox(height: 50),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                runAlignment: WrapAlignment.spaceBetween,
                children: skills.map(_buildSkill).toList(),
              ),
            ],
          ),
        ),
        mobileScreen: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: 50,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                  color: AppColors.greyLight,
                  child: Image.network(
                    ownerImage,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'ABOUT ME',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 13,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: AppColors.yellow,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
                child: const Text('HIRE ME NOW' , style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  launch(cvUrl);
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.black,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
                child: const Text('VIEW RESUME' , style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              const SizedBox(height: 50),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 75, height: 2, color: AppColors.yellow),
              const SizedBox(height: 3),
              Container(width: 50, height: 2, color: AppColors.yellow),
              const SizedBox(height: 25),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: skills.map(_buildSkill).toList(),
              ),
            ],
          ),
        ),
      );

  Widget _buildSkill(Skill skill) => Chip(label: Text(skill.name));
}
