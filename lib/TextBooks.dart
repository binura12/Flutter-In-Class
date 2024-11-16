import 'package:flutter_class/Books.dart';

class TextBooks extends Books {
  String _subjectArea;
  int _gradeLevel;

  TextBooks(String title, String author, String isbn, this._subjectArea, this._gradeLevel)
      : super(title, author, isbn) {
    if (_gradeLevel < 1 || _gradeLevel > 12){
      throw Exception('Grade level must be between 1 and 12');
    }
  }

  //Getters to retrieve subjectArea and gradeLevel properties
  String get subjectArea => _subjectArea;
  int get gradeLevel => _gradeLevel;

  //Setters to update subjectArea and gradeLevel properties
  set subjectArea(String subjectArea){
    _subjectArea = subjectArea;
  }
  set gradeLevel(int gradeLevel){
    if (gradeLevel >= 1 && gradeLevel <= 12){
      _gradeLevel = gradeLevel;
    } else {
      throw Exception('Grade level must be between 1 and 12');
    }
  }
}