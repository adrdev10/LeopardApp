import 'dart:async';

import 'package:complex_ui_app_1/Domain/entities/picture.dart';
import 'package:complex_ui_app_1/Domain/entities/pictureCollection.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetAllPicturesUseCase extends UseCase<PictureCollection, void> {
  @override
  Future<Stream<PictureCollection>> buildUseCaseStream(void params) {
    // TODO: implement buildUseCaseStream
    final StreamController controller = StreamController<PictureCollection>();
    try {
      
    }
  }
}
