import 'package:flutter_class/Books.dart';

class BookManagementSystem {
  List<Books> _books = [];

  void addBook(Books book) {
    _books.add(book);
  }

  void removeBook(String isbn) {
    _books.removeWhere((book) => book.isbn == isbn);
  }

  //update Book Status
  void updateBookStatus(String isbn, BookStatus newStatus) {
    for (Books book in _books) {
      if (book.isbn == isbn) {
        book.updateStatus(newStatus);
        return;
      }
    }
    throw Exception('Book not found');
  }

  //Search By Title
  List<Books> searchByTitle(String title) {
    List<Books> foundBooks = [];

    for (Books book in _books) {
      if (book.title.toLowerCase().contains(title.toLowerCase())) {
        foundBooks.add(book);
      }
    }
    return foundBooks;
  }

  //Search By Author
  List<Books> searchByAuthor(String author) {
    List<Books> foundBooks = [];

    for (var book in _books) {
      if (book.author.toLowerCase().contains(author.toLowerCase())) {
        foundBooks.add(book);
      }
    }
    return foundBooks;
  }
}