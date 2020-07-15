class Picture {
  //n02088094_1003.jpg
  String _url;
  String _id;

  Picture(this._url, this._id);

  //Retrieve image
  String get getImageUrl => _url;
  set imageUrl(String url) => _url = url;

  String get getId => _id;
  set setID(String id) => _id = id;

  getPictureName() => _url.split("/").last;

  @override
  bool operator ==(picture) {
    if (picture is Picture && picture._url == this._url) return true;
    return false;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}
