import 'package:flutter/material.dart';
import 'package:logic/models/project.dart';

import 'responsive_widget.dart';
import 'icon.dart';

class Statistics extends StatelessWidget {

  final List<Project> projects;
  final int yearsOfExperience;

  const Statistics({Key? key,required this.projects , required this.yearsOfExperience}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        height: 400,
        color: Colors.black.withOpacity(.7),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildStatistic(
              context, 'assets/icons/briefcase.png', yearsOfExperience.toString()+'+', 'Years of Experience'),
          _buildStatistic(context, 'assets/icons/menu.png', '${projects.length}+',
              'Projects Done'),
          _buildStatistic(context, 'assets/icons/happy.png', '50+', 'Happy Clients'),
          _buildStatistic(context, 'assets/icons/coffee.png', '∞', 'Coffee Cups'),
        ]),
      ),
      mobileScreen: Container(
        color: Colors.black54,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            _buildStatistic(
                context, 'assets/icons/briefcase.png',  yearsOfExperience.toString()+'+', 'Years of Experience'),
            const SizedBox(height: 50),
            _buildStatistic(context, 'assets/icons/menu.png', '${projects.length}+',
                'Projects Done'),
            const SizedBox(height: 50),
            _buildStatistic(context, 'assets/icons/happy.png', '50+', 'Happy Clients'),
            const SizedBox(height: 50),
            _buildStatistic(context, 'assets/icons/coffee.png', '∞', 'Coffee Cups'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic(
      BuildContext context, String icon, String total, String description) {
    return ResponsiveWidget(
      desktopScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, size: 50),
          const SizedBox(height: 5),
          Text(
            total,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      mobileScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, size: 40),
          const SizedBox(height: 5),
          Text(
            total,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
