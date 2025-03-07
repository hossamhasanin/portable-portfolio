import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logic/controller.dart';
import 'package:logic/viewstate.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'contact_us.dart';
import 'footer.dart';
import 'header.dart';
import 'icon.dart';
import 'my_projects.dart';
import 'responsive_widget.dart';
import 'statistics.dart';
import 'working_process.dart';
import '../config/colors.dart';
import '../config/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _headerGlobalKey = GlobalKey();
  final _aboutGlobaleKey = GlobalKey();
  final _statisticsGlobaleKey = GlobalKey();
  final _workingProcessGlobaleKye = GlobalKey();
  final _recentProjectsGlobaleKey = GlobalKey();
  final _contactUsGlobaleKey = GlobalKey();

  final _scrollController = ScrollController();

  final _fabStream = StreamController<bool>();

  final PortfolioController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _fabStream.sink.add(_scrollController.offset > 500);
    });

    _controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      var viewState = _controller.viewState.value;
      if (viewState.loading){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (viewState.error.isNotEmpty){
        return Center(
          child: Text(viewState.error),
        );
      }

      return ResponsiveWidget(
        desktopScreen: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  key: _headerGlobalKey,
                  titleSpacing: 0,
                  toolbarHeight: 100,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/cover.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black87,
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .15,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Container(
                        width: 40,
                        height: 40,
                        color: AppColors.yellow,
                        // child: Image.asset('assets/images/person.jpg'),
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(500),
                    child: _displayHeader(viewState),
                  ),
                  actions: [
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: _scrollToAbout,
                          highlightColor: Colors.white60,
                          child: const Text(
                            'About Me',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        MaterialButton(
                          onPressed: _scrollToStatistics,
                          child: const Text(
                            'Experience',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // MaterialButton(
                        //   onPressed: _scrollToWorkingProcess,
                        //   child: const Text(
                        //     'Process',
                        //     style: TextStyle(
                        //         color: Colors.white, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        MaterialButton(
                          onPressed: _scrollToRecentProjects,
                          child: const Text(
                            'Portfolio',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: _scrollToContactUs,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.yellow,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                          ),
                          child: const Text(
                            'Contact Me',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * .15),
                  ],
                ),
                ..._slivers(viewState),
              ],
            ),
          ),
          floatingActionButton: _buildFab(),
        ),
        mobileScreen: Scaffold(
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        'assets/images/leaves.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: _scrollToAbout,
                    title: const Text(
                      'About Me',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    onTap: _scrollToStatistics,
                    title: const Text(
                      'Experience',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // ListTile(
                  //   onTap: _scrollToWorkingProcess,
                  //   title: const Text(
                  //     'Process',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  ListTile(
                    onTap: _scrollToRecentProjects,
                    title: const Text(
                      'Portfolio',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 20),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: _scrollToContactUs,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellow,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Contact Me',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          launch(AppConstants.github);
                        },
                        child: AppIcon(
                          'assets/icons/github.png',
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          launch(AppConstants.linkedin);
                        },
                        child: AppIcon(
                          'assets/icons/linkedin.png',
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          launch(AppConstants.twitter);
                        },
                        child: AppIcon(
                          'assets/icons/twitter.png',
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          launch(AppConstants.facebook);
                        },
                        child: AppIcon(
                          'assets/icons/facebook.png',
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  key: _headerGlobalKey,
                  titleSpacing: 0,
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  leading: Align(
                    child: Builder(
                      builder: (ctx) => InkWell(
                        onTap: () {
                          Scaffold.of(ctx).openDrawer();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: AppColors.yellow,
                            child: Image.asset('assets/images/leaves.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/cover.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black87,
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(350),
                    child: _displayHeader(viewState),
                  ),
                ),
                ..._slivers(viewState),
              ],
            ),
          ),
          floatingActionButton: _buildFab(),
        ),
      );
    });
  }

  List<Widget> _slivers(PortfolioViewState viewState) => [
        SliverToBoxAdapter(
          key: _aboutGlobaleKey,
          child: About(
            ownerImage: viewState.portfolioMainData.ownerImage,
            description: viewState.portfolioMainData.description,
            skills: viewState.skills,
            cvUrl: viewState.portfolioMainData.cvUrl,
          )
        ),
        SliverToBoxAdapter(
          key: _statisticsGlobaleKey,
          child:  Statistics(
            projects: viewState.projects,
            yearsOfExperience: viewState.portfolioMainData.yearsOfExperience,
          ),
        ),
        // SliverToBoxAdapter(
        //   key: _workingProcessGlobaleKye,
        //   child: WorkingProcess(),
        // ),
        SliverToBoxAdapter(
          key: _recentProjectsGlobaleKey,
          child: MyProjects(projects: viewState.projects,)
        ),
        SliverToBoxAdapter(
          key: _contactUsGlobaleKey,
          child: ContactUs(),
        ),
        SliverToBoxAdapter(
          child: Footer(
            projects: viewState.projects,
            description: viewState.portfolioMainData.description,
            email: viewState.portfolioMainData.email,
            phone: viewState.portfolioMainData.phone,
            githubAccount: viewState.portfolioMainData.githubAccount,
            facebookAccount: viewState.portfolioMainData.facebookAccount,
            twitterAccount: viewState.portfolioMainData.twitterAccount,
            linkedinAccount: viewState.portfolioMainData.linkedinAccount,
          ),
        ),
      ];

  Widget _buildFab() {
    return StreamBuilder<bool>(
      stream: _fabStream.stream,
      builder: (_, data) {
        final bool showFab = data.hasData && data.data!;
        return AnimatedOpacity(
          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: showFab
                ? _scrollToHeader
                : null, // make sure user cannot click when button hidden
            mini: true,
            child: const AppIcon('assets/icons/double-up-arrow.png', size: 20),
          ),
        );
      },
    );
  }

  void _scrollToHeader() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToAbout() {
    Scrollable.ensureVisible(
      _aboutGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToStatistics() {
    Scrollable.ensureVisible(
      _statisticsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  // void _scrollToWorkingProcess() {
  //   Scrollable.ensureVisible(
  //     _workingProcessGlobaleKye.currentContext!,
  //     duration: const Duration(seconds: 1),
  //   );
  // }

  void _scrollToRecentProjects() {
    Scrollable.ensureVisible(
      _recentProjectsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToContactUs() {
    Scrollable.ensureVisible(
      _contactUsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  Widget _displayHeader(PortfolioViewState viewState){
    return Header(
      job: viewState.portfolioMainData.career,
      name: viewState.portfolioMainData.ownerName,
      description: viewState.portfolioMainData.description,
      cvUrl: viewState.portfolioMainData.cvUrl,
    );
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}
