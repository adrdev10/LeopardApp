import 'package:complex_ui_app_1/Domain/entities/picture.dart';

class PictureCollection {
  List<Picture> _pictures;

  PictureCollection(this._pictures);

  PictureCollection.empty() {
    _pictures = [];
  }
  //Get last picture added to the collection
  getLast() => _pictures?.last;

  int get length => _pictures.length;

  //Get first picture added to the collection
  getFirst() => _pictures?.first;

  //Shuffle pictures
  shufflePics() => _pictures.shuffle();

  //Push picture to last
  pushPicture(Picture picture) {
    _pictures = [..._pictures, picture];
  }

  pushPictures(List<Picture> pictures) {
    _pictures = [..._pictures, ...pictures];
  }

  //check if two collections the same
  bool isCollectionEqual(collection) {
    if (collection is PictureCollection &&
        collection.length == _pictures.length) {
      for (int i = 0; i < collection.length; i++) {
        if (collection._pictures[i] != _pictures[i]) return false;
      }
    }
    return true;
  }
}
