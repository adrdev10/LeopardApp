import 'package:complex_ui_app_1/App/Pages/home/home_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePresenterState();
  }
}

class HomePresenterState extends ViewState<HomeView, HomeController> {
  HomePresenterState(HomeController controller) : super(controller);

  @override
  Widget buildPage() {
    // TODO: implement buildPage
  }
}
