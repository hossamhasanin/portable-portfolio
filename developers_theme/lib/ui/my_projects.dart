import 'package:developers_theme/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:logic/models/project.dart';
import 'responsive_widget.dart';
import '../config/styles.dart';

class MyProjects extends StatelessWidget {

  final List<Project> projects;

  const MyProjects({Key? key,required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: AppColors.greyLight,
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Text('MY PROJECTS', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            ...projects.map((p) => _buildProject(context, p)).toList(),
          ],
        ),
      ),
      mobileScreen: Container(
        color: AppColors.greyLight,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              'MY PROJECTS',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            Wrap(
              children: projects.map((p) => _buildProject(context, p)).toList(),
              spacing: 5,
              runSpacing: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project) =>
      ResponsiveWidget(
        desktopScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .3,
                    child: Image.network(project.img),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .075),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.name, style: AppStyles.title),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.description),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        Wrap(
                          spacing: 10,
                          children: project.skills
                              .map((s) => Chip(label: Text(s)))
                              .toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            launch(project.url);
                          },
                          style: OutlinedButton.styleFrom(
                            primary: AppColors.yellow,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: AppColors.yellow!.withOpacity(.5),
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('Visit' , style: TextStyle(color: AppColors.yellow),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.black.withOpacity(.1),
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
        mobileScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * .75,
                child: Image.network(project.img),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .075),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(project.name, style: AppStyles.title),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(
                project.description,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children:
                    project.skills.map((s) => Chip(label: Text(s))).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              OutlinedButton(
                onPressed: () {
                  launch(project.url);
                },
                style: OutlinedButton.styleFrom(
                  primary: AppColors.yellow,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColors.yellow!.withOpacity(.5),
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Visit' , style: TextStyle(
                  color: AppColors.yellow
                ),),
              ),
              Divider(
                color: AppColors.black.withOpacity(.1),
                height: 50,
                thickness: 1,
              ),
            ],
          ),
        ),
      );
}
