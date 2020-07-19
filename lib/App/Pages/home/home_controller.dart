import 'package:complex_ui_app_1/App/Pages/home/home_presenter.dart';
import 'package:complex_ui_app_1/Domain/entities/pictureCollection.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  PictureCollection _pictureCollection;
  HomePresenter _homePresenter;
  HomeController(pictureCollectionRepo)
      : _homePresenter = HomePresenter(pictureCollectionRepo),
        super();
  @override
  void initListeners() {
    // TODO: implement initListeners
    _homePresenter.getPicturesOnNext = (picCollection) {
      _pictureCollection = picCollection;
      refreshUI();
    };

    _homePresenter.getPicturesOnComplete = () {
      print("Collection fetched");
    };

    _homePresenter.getPicturesOnError = (err) {
      print("Error while retrieving data");
      _pictureCollection = null;
      var state = getState();
      state.toDiagnosticsNode();
      refreshUI();
    };
  }
}
