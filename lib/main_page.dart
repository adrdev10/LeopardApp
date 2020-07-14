import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageOffsetNotifier with ChangeNotifier {
  double page;
  double offset = 0;

  PageOffsetNotifier({PageController pageController}) {
    pageController.addListener(() {
      offset = pageController.offset;
      page = pageController.page;
      notifyListeners();
    });
  }

  double get getOffset => offset;
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (_) => PageOffsetNotifier(pageController: _pageController),
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            PageView(
              controller: _pageController,
              physics: ClampingScrollPhysics(),
              children: <Widget>[LeopardImage(), Vulture()],
            ),
            AppBar(),
            LeopardPage(),
            VulturePage(),
          ],
        )),
      ),
    );
  }
}

class LeopardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<PageOffsetNotifier>(
      builder: (context, value, child) {
        return Positioned(
          width: MediaQuery.of(context).size.width * 1.6,
          left: 0.85 * -value.getOffset,
          child: child,
        );
      },
      child: IgnorePointer(
        ignoring: true,
        child: Image.network(
            'https://raw.githubusercontent.com/MarcinusX/sy_expedition_travel_challenge/master/assets/leopard.png'),
      ),
    );
  }
}

class Vulture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
    // TODO: implement build
    // return Center(
    //   child: Padding(
    //     padding: EdgeInsets.only(bottom: 30),
    //     child: Image.network(
    //       'https://raw.githubusercontent.com/MarcinusX/sy_expedition_travel_challenge/master/assets/vulture.png',
    //       height: MediaQuery.of(context).size.height / 3,
    //     ),
    //   ),
    // );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Text(
              "SY",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.menu),
          ],
        ),
      ),
    );
  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<PageOffsetNotifier>(
      builder: (context, value, child) {
        return Positioned(
          left: 1.2 * MediaQuery.of(context).size.width - 0.75 * value.offset,
          child: child,
        );
      },
      child: IgnorePointer(
        ignoring: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: 70),
          child: Image.network(
            'https://raw.githubusercontent.com/MarcinusX/sy_expedition_travel_challenge/master/assets/vulture.png',
            height: MediaQuery.of(context).size.height * .3,
          ),
        ),
      ),
    );
  }
}
