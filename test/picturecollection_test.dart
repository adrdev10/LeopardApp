import 'package:complex_ui_app_1/Domain/entities/picture.dart';
import 'package:complex_ui_app_1/Domain/entities/pictureCollection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PictureCollection pictureCollection = PictureCollection.empty();
  pictureCollection.pushPicture(Picture("/api/url/image1", "0"));
  pictureCollection.pushPicture(Picture("image2", "1"));
  test("Test get first element", () {
    expect(pictureCollection.getFirst().getImageUrl, "/api/url/image1");
  });

  test("Test get last element", () {
    expect(pictureCollection.getLast().getImageUrl, "image2");
  });

  group("Number of pictures", () {
    test("Check length of collection", () {
      pictureCollection.pushPictures(
          [Picture("api/url/image3", "2"), Picture("api/url/image4", "3")]);
      expect(pictureCollection.length, 4);
    });

    test("Check if two collections are the same", () {
      PictureCollection pictureCollection2 = pictureCollection;
      expect(pictureCollection2.isCollectionEqual(pictureCollection), true);
    });
  });
}
