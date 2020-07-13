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
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Center(
                child: LeopardPage(),
              ),
              Center(
                child: Vulture(),
              )
            ],
          ),
          LeopardPage()
        ],
      )),
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
          top: 100,
          left: -value.getOffset,
          child: Image.network(
              'https://raw.githubusercontent.com/MarcinusX/sy_expedition_travel_challenge/master/assets/leopard.png'),
          height: 250,
        );
      },
      child: Image.network(
          'https://raw.githubusercontent.com/MarcinusX/sy_expedition_travel_challenge/master/assets/leopard.png'),
    );
  }
}

class Vulture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.network(
          'https://raw.githubusercontent.com/MarcinusX/sy_expedition_travel_challenge/master/assets/vulture.png'),
    );
  }
}
