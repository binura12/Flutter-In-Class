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

  var book2 = Books(
      "The Catcher in the Rye",
      "J.D. Salinger",
      "9780316769174"
  );
  library.addBook(book2);

  var textBook1 = TextBooks(
    "The Great Gatsby",
    "F. Scott Fitzgerald",
    "9780743273565",
    "Fiction",
    10
  );
  library.addBook(textBook1);
  
  //Search for books by author
  for (var book in library.searchByAuthor("Scott")) {
    print(book.title);
  }
  
  //Search for books by title
  for (var book in library.searchByTitle("The Catcher in the Rye")) {
    print(book.author);
  }
  
  //Update Book Status
  library.updateBookStatus("9780316769174", BookStatus.borrowed);
  
  //Delete a book
  library.removeBook("9780316769174");
}