import 'package:complex_ui_app_1/Domain/entities/pictureCollection.dart';
import 'package:complex_ui_app_1/Domain/usecases/get_all_pictures_usescase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  Function getPicturesOnNext;
  Function getPicturesOnComplete;
  Function getPicturesOnError;

  GetAllPicturesUseCase getAllPicturesUseCase;

  HomePresenter(pictureRepo) {
    getAllPicturesUseCase = GetAllPicturesUseCase(pictureRepo);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //unsubsribe from stream
    getAllPicturesUseCase.dispose();
  }

  void getPuctures() {
    getAllPicturesUseCase.execute(GetPicturesObserver(this));
  }
}

class GetPicturesObserver extends Observer<GetAllPicturesUseCaseResponse> {
  final HomePresenter homePresenter;
  GetPicturesObserver(this.homePresenter);
  @override
  void onComplete() {
    // TODO: implement onComplete
    assert(homePresenter.getPicturesOnComplete != null);
    homePresenter.getPicturesOnComplete();
  }

  @override
  void onError(e) {
    // TODO: implement onError
    homePresenter.getPicturesOnError();
  }

  @override
  void onNext(response) {
    // TODO: implement onNext
    homePresenter.getPicturesOnNext();
  }
}
