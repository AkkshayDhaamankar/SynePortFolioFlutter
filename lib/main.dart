import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:syne_portfolio_app/services/api_call.dart';

import 'models/syne.dart';
import 'widgets/TopHalf/top_half.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syne Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(context: context),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final BuildContext context;
  MyHomePage({Key key, this.title, this.context}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.context);
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _controller;
  Syne syne;
  BuildContext ctx;

  _MyHomePageState(this.ctx);
  @override
  void initState() {
    _controller = new TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiCall().getSyneData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            syne = snapshot.data;
            return Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.arrow_back),
                  title: Align(
                      alignment: Alignment.centerLeft, child: Text(syne.title)),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      topHalf(syne),
                      aboveTabs(syne),
                      tabsView(),
                      tabBarView()
                    ],
                  ),
                ),
                bottomNavigationBar: ConvexAppBar(
                  backgroundColor: Colors.white,
                  activeColor: Colors.lightBlue,
                  color: Colors.grey,
                  style: TabStyle.reactCircle,
                  items: [
                    TabItem(icon: Icons.home_outlined, title: 'Home'),
                    TabItem(icon: Icons.explore_outlined, title: 'Discovery'),
                    TabItem(icon: Icons.add, title: 'Add'),
                    TabItem(icon: Icons.message, title: 'Message'),
                    TabItem(
                        icon: Icons.notifications_on_outlined, title: 'Alerts'),
                  ],
                  initialActiveIndex: 2, //optional, default as 0
                  onTap: (int i) => print('click index=$i'),
                ));
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

// Bottom Half
  Widget tabsView() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: new Container(
        child: new TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          labelColor: Colors.black,
          controller: _controller,
          tabs: [
            Tab(
              text: 'About Me',
            ),
            Tab(
              text: 'Projects',
            ),
            Tab(
              text: 'Events',
            ),
            Tab(
              text: 'Stories',
            ),
            Tab(
              text: 'Hobbies',
            ),
          ],
        ),
      ),
    );
  }

  Widget tabBarView() {
    return Container(
      height: 700,
      child: TabBarView(
        controller: _controller,
        children: <Widget>[
          aboutMeTab(),
          Card(
            child: Center(child: Text("Projects")),
          ),
          Card(
            child: Center(child: Text("Events")),
          ),
          Card(
            child: Center(child: Text("Stories")),
          ),
          Card(
            child: Center(child: Text("Hobbies")),
          ),
        ],
      ),
    );
  }

  Widget aboutMeTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            child: Container(
              width: double.infinity,
              height: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                    child: Text(
                      'About Me',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                    child: Text(
                      syne.about,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Profile URL',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              syne.profile_url,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.copy,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                child: Text(
                  'Work Experience',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: int.parse(syne.work_experience),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    isThreeLine: true,
                    leading: syne.work_image.split(",")[index] == "null"
                        ? Icon(Icons.badge)
                        : Image.asset(
                            "assets/" +
                                syne.work_image.split(",")[index] +
                                ".png",
                            width: 30,
                            height: 30,
                          ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(syne.job_title.split(",")[index]),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            syne.company.split(",")[index],
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            syne.timeperiod.split(",")[index],
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            syne.job_location.split(",")[index],
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                child: Text(
                  'Education',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: int.parse(syne.education),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.school_outlined),
                    title: Text(syne.school_name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            syne.school_time,
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            syne.school_location,
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
