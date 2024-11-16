import 'package:flutter_class/BookManagementSystem.dart';
import 'package:flutter_class/Books.dart';
import 'package:flutter_class/TextBooks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BookManagementSystem library;
  late Books book1;
  late Books book2;
  late TextBooks textBook1;

  setUp(() {
    library = BookManagementSystem();
    book1 = Books("The Catcher in the Rye", "J.D. Salinger", "9780316769174");
    book2 = Books("To Kill a Mockingbird", "Harper Lee", "9780446310789");
    textBook1 =
        TextBooks("Physics 101", "John Smith", "9780123456789", "Physics", 10);
  });

  group('BookManagementSystem Tests', () {
    test('addBook', () {
      library.addBook(book1);
      expect(library.collection.length, 1);
    });

    test('removeBook', () {
      library.addBook(book1);
      library.addBook(book2);
      expect(library.collection.length, 2);

      library.removeBook("9780316769174");
      expect(library.collection.length, 1);
    });

    test("searchBookByTitle", () {
      library.addBook(book1);
      library.addBook(book2);

      var result = library.searchByTitle("kill");
      expect(result.length, 1);
    });

    test("searchBookByAuthor", () {
      library.addBook(book1);
      library.addBook(book2);

      var result = library.searchByAuthor("Harper");
      expect(result.length, 1);
    });

    test('Filter By Status Test', () {
      library.addBook(book1);
      library.addBook(book2);
      library.updateBookStatus("9780316769174", BookStatus.borrowed);
      expect(() => library.updateBookStatus("6546463156", BookStatus.borrowed),
          throwsException);

      var availableBooks = library.filterByStatus(BookStatus.available);
      expect(availableBooks.length, 1);
    });

    test('Invalid ISBN Test', () {
      expect(() => Books("Test Book", "Test Author", "123"), throwsException);
    });

    test('Invalid Grade Level Test', () {
      expect(
          () => TextBooks(
              "Test Book", "Test Author", "9780123456789", "Math", 13),
          throwsException);
    });

    test('Should successfully set the title when a valid string is provided',
        () {
      var book = Books('Old Title', 'Author', '1234567890123');
      book.title = 'New Title';
      expect(book.title, 'New Title');
    });

    test('Should successfully set the author when a valid string is provided',
        () {
      var book = Books('Title', 'old Author', '1234567890123');
      book.author = 'New Author';
      expect(book.author, 'New Author');
    });

    test('Should successfully set the isbn when a valid string is provided',
        () {
      var book = Books('Title', 'Author', '1234567890123');
      book.isbn = '1234567890199';
      expect(book.isbn, '1234567890199');
    });

    test('Should successfully set subjectArea when a valid string is provided',
        () {
      var textBook = TextBooks('Title', 'Author', '1234567890123', 'Math', 10);
      textBook.subjectArea = 'Science';
      expect(textBook.subjectArea, 'Science');
    });

    test('Should successfully set gradeLevel to 1', () {
      var textBook = TextBooks('Title', 'Author', '1234567890123', 'Math', 5);
      textBook.gradeLevel = 1;
      expect(textBook.gradeLevel, 1);
    });

    test('Should throw an exception when setting gradeLevel to 13', () {
      var textBook = TextBooks('Title', 'Author', '1234567890123', 'Math', 5);
      expect(() => textBook.gradeLevel = 13, throwsException);
    });
  });
}
