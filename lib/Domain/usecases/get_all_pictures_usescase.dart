import 'dart:async';

import 'package:complex_ui_app_1/Domain/entities/picture.dart';
import 'package:complex_ui_app_1/Domain/repository/picture_collection_repository.dart';
import 'package:complex_ui_app_1/Domain/entities/pictureCollection.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetAllPicturesUseCase extends UseCase<PictureCollection, void> {
  PictureCollectionRepository pictureRepo;
  @override
  Future<Stream<PictureCollection>> buildUseCaseStream(void params) async {
    // TODO: implement buildUseCaseStream
    final StreamController controller = StreamController<PictureCollection>();
    try {
      var pictures = await pictureRepo.getAllPictures();
      controller.add(pictures);
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}
