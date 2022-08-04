import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/widgets/home_page/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(Icons.power_settings_new_outlined),
        title: const Text(
          'LymphoWear',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.grey[200],
              height: 2.0,
            )),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.settings_outlined), onPressed: () {}),
        ],
      ),
      body: Center(
        child: getPage(),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            curIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedIndex: curIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.mode_edit_outline_outlined),
            label: 'Mode',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_applications_outlined),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

  Widget getPage() {
    Widget? page;
    switch (curIndex) {
      case 0:
        page = const HomeWidget();
        break;
      case 1:
        page = mode();
        break;
      case 2:
        page = setting();
        break;
    }
    return page!;
  }

  Widget home() {
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Home'),
          ],
        ),
      ),
    );
  }

  Widget mode() {
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Mode'),
          ],
        ),
      ),
    );
  }

  Widget setting() {
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Setting'),
          ],
        ),
      ),
    );
  }
}
