enum BookStatus {
  available,
  borrowed
}
class Books {
  String _title;
  String _author;
  String _isbn;
  BookStatus _status;

  //Constructor
  Books(this._title, this._author, this._isbn) : _status = BookStatus.available {
    if (_isbn.length !=13){
      throw Exception('ISBN must be 13 digits long');
    }
  }

  //Getters
  String get title => _title;
  String get author => _author;
  String get isbn => _isbn;
  BookStatus get status => _status;

  //Setters
  set title(String title){
    _title = title;
  }
  set author(String author){
    _author = author;
  }
  set isbn(String isbn){
    if (isbn.length == 13){
      _isbn = isbn;
    } else {
      throw Exception('ISBN must be 13 digits long');
    }
  }

  //Status Update Method
  void updateStatus(BookStatus newStatus) {
    _status = newStatus;
  }
}