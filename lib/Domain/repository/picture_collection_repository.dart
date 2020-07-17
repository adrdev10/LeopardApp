import 'package:complex_ui_app_1/Domain/entities/pictureCollection.dart';

abstract class PictureCollectionRepository {
  Future<PictureCollection> getAllPictures();
}
