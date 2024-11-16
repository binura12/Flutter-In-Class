import 'package:flutter_class/Books.dart';
import 'package:flutter_class/TextBooks.dart';

class BookManagementSystem {
  List<Books> collection = [];

  // Add Book To Collection
  void addBook(Books book) {
    collection.add(book);
  }

  // Remove Book From Collection
  void removeBook(String isbn) {
    collection.removeWhere((book) => book.isbn == isbn);
  }

  // Update Book Status
  void updateBookStatus(String isbn, BookStatus newStatus) {
    for (Books book in collection) {
      if (book.isbn == isbn) {
        book.updateStatus(newStatus);
        return;
      }
    }
    throw Exception('Book not found');
  }

  // Search By Title
  List<Books> searchByTitle(String title){
    List<Books> foundBooks = [];

    for (Books books in collection) {
      if (books.title.toLowerCase().contains(title.toLowerCase())){
        foundBooks.add(books);
      }
    }
    return foundBooks;
  }

  // Search By Author
  List<Books> searchByAuthor(String author){
    List<Books> foundBooks = [];

    for (Books books in collection) {
      if (books.author.toLowerCase().contains(author.toLowerCase())){
        foundBooks.add(books);
      }
    }
    return foundBooks;
  }

  //Basic Filtering Method
  List<Books> filterByStatus(BookStatus status){
    return collection.where((book) => book.status == status).toList();
  }
}