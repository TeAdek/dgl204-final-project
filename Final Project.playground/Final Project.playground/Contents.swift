import UIKit
import Foundation

/// List of Genres with 12 member values
enum Genres: String {
    case graphicNovel = "Graphic Novel"
    case scienceFiction = "Science Fiction"
    case fantasy = "Fantasy"
    case literaryFiction = "Literary Fiction"
    case romance = "Romance"
    case mystery = "Mystery"
    case manga = "Manga"
    case cookbook = "Cookbook"
    case biography = "Biography"
    case kidsFiction = "Kids Fiction"
    case teenFiction = "Teen Fiction"
    case action = "Action"
}

//Book Description
/// Encapsulate Book Description Properties
struct BookDescription{
    var title: String
    var author: String
    var rating: Double
    var categories: Genres
    var publisher: String
    var publishDate: String
    var page: Int
    var isbn: Int
}
var appollo_murders = BookDescription(title: "The Apollo Murders", author: "Chris Hadfield", rating: 3.6, categories: .action, publisher: "Random House Canada", publishDate: "Oct. 12 2021", page: 480, isbn: 9780735282353)

var babysitter_club = BookDescription(title: "The Baby-sitters Club #1", author: "Oliver Jeffers", rating: 3.0, categories: .kidsFiction, publisher: "Graphix", publishDate: "April 28 2015", page: 192, isbn: 9780545813877)

var ghost_in_this_house = BookDescription(title: "There’s a Ghost in this House", author: "Ann M. Martin", rating: 4.0, categories: .graphicNovel, publisher: "HarperCollins Children’s Books", publishDate: "Oct. 5 2021", page: 44, isbn: 9780008298357)


///Library To Store Books
class Book{
    var book = [BookDescription]()
    
    func create(book library: BookDescription){
        book.append(library)
    }
 
    func search(for novel: String) -> BookDescription?{
        for books in self.book{
            if books.title == novel{
                return books
            }
        }
        return nil
    }
}

var novel = Book()
novel.create(book: ghost_in_this_house)
novel.create(book: appollo_murders)
novel.book
var ghost = novel.search(for: "There’s a Ghost in this House")
var apollo = novel.search(for: "The Apollo Murders")
var babysitter = novel.search(for: "The Baby-sitters Club #1")
print(ghost as Any)
print(babysitter as Any)


///Add the Books You Own To A Online Book Shelf
class BookShelf{
    var shelf_name: String
    var book = [BookDescription]()
    
    
    init(shelf_name: String){
        self.shelf_name = shelf_name
    }
    
    func add(on shelves: BookDescription?){
        guard let shelves = shelves else {
            print("The book is not available")
            return
        }
        book.append(shelves)
    }
    
    func search(for novel: String) -> String {
        for books in self.book{
            if books.title.contains(novel){
                return "\(books.title) is found"
            }
        }
        return "\(novel) book is not found"
    }
    
    func displayShelf() -> String{
        return "\(shelf_name) shelf has \(book.count) books"
    }
    
    func booklist() -> String{
        var sentence = "In \(shelf_name) shelf, we have:"
        for books in book{
            sentence += "\n\(books.title) \n\(books.author) \n\(books.page) \n\(books.publishDate) \n\(books.categories.rawValue)\n"
        }
        return sentence
    }
    
}


var nostaglia_shelf = BookShelf(shelf_name: "Nostaglia")
nostaglia_shelf.add(on: ghost)
nostaglia_shelf.add(on: apollo)

print(nostaglia_shelf.displayShelf())
print(nostaglia_shelf.booklist())
print(nostaglia_shelf.search(for: "a"))

protocol Sort{
    func titleDescendingOrder()->[BookDescription]
    func titleAscendingOrder()->[BookDescription]
    func authorDescendingOrder()->[BookDescription]
    func authorAscendingOrder()->[BookDescription]
    func rankingAscendingOrder()->[BookDescription]
    func rankingDescendingOrder()->[BookDescription]
    func publishDateDescendingOrder()->[BookDescription]
    func publishDateAscendingOrder()->[BookDescription]
}

///Choose How To Sort Books In The Shelf
extension BookShelf: Sort{
    func titleDescendingOrder()->[BookDescription]{
        return book.sorted(by: { $0.title < $1.title })
    }
    func titleAscendingOrder()-> [BookDescription]{
        return book.sorted(by: { $0.title > $1.title })
    }
    func authorDescendingOrder()->[BookDescription]{
        return book.sorted(by: { $0.author < $1.author })
    }
    func authorAscendingOrder()->[BookDescription]{
        return book.sorted(by: { $0.author > $1.author })
    }
    func rankingAscendingOrder()->[BookDescription]{
        return book.sorted(by: { $0.rating > $1.rating })
    }
    func rankingDescendingOrder()->[BookDescription]{
        return book.sorted(by: { $0.rating < $1.rating })
    }
    func publishDateDescendingOrder()->[BookDescription]{
        return book.sorted(by: { $0.publishDate < $1.publishDate })
    }
    func publishDateAscendingOrder()->[BookDescription]{
        return book.sorted(by: { $0.publishDate > $1.publishDate })
    }
}

nostaglia_shelf.titleAscendingOrder()

///Contains a List of Bookshelves
class Shelves{
    var shelf = [BookShelf]()
    
    func addlist(_ shelves: BookShelf) {
        shelf.append(shelves)
    }
    
    func viewShelves()->String{
        var statement = "Shelves available are: \n"
        for shelves in shelf{
            statement += "\(shelves.shelf_name)\n"
        }
        return statement
    }
    
    func search(for shelves: String) -> String {
        for shelf in self.shelf{
            if shelf.shelf_name.contains(shelves){
                return "\(shelves) is found"
            }
        }
        return "\(shelves) book is not found"
    }
}
var b = Shelves()
b.addlist(nostaglia_shelf);
print(b.viewShelves())

//Add Books You Desire to Buy In A Wishlist
class WishList{
    var book = [BookDescription]()
    
    func insert(book: BookDescription) {
        self.book.append(book)
    }
   
    func search(for novel: String) -> String {
        for books in self.book{
            if books.title == novel{
                return "\(books.title) is found"
            }
        }
        return "\(novel) book is not found"
    }
    
    func booklist() -> String{
        var sentence = "In the Wishlist, there is:"
        for books in self.book{
            sentence += "\n\(books.title) \n\(books.author) \n\(books.rating) \n\(books.categories.rawValue)\n"
        }
        return sentence
    }
}

var wishlist = WishList()
wishlist.insert(book: babysitter_club)
print(wishlist.search(for: "The Baby-sitters Club #1"))

print(wishlist.booklist())
