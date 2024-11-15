import 'package:flutter_class/BookManagementSystem.dart';
import 'package:flutter_class/Books.dart';
import 'package:flutter_class/TextBooks.dart';

void main() {
  var library = BookManagementSystem();

  var book1 = Books(
    "The Catcher in the Rye",
    "J.D. Salinger",
    "9780316769174"
  );
  library.addBook(book1);

  var book2 = TextBooks(
    "The Great Gatsby",
    "F. Scott Fitzgerald",
    "9780743273565",
    "Fiction",
    10
  );
  library.addBook(book2);

  for (var book in library.searchByAuthor("Scott")) {
    print(book.title);
  }
}