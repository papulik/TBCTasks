import Foundation

//MARK: - სავალდებულო ამოცანები.

/* 1.
 შევქმნათ Class Book.
 Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
 Designated Init.
 Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
 Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
 */

class Book {
    let bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool = false) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func bookBorrowed() {
        isBorrowed = true
    }
    
    func bookReturned() {
        isBorrowed = false
    }
}

/* 2.
 შევქმნათ Class Owner
 Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
 Designated Init.
 Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
 Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
 */

class Owner {
    let ownerId: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(ownerId: Int, name: String) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = []
    }
    
    func borrowBook(book: Book) {
        guard !book.isBorrowed else {
            print("ეს წიგნი უკვე ნათხოვნია.")
            return
        }
        
        borrowedBooks.append(book)
        book.bookBorrowed()
    }
    
    func returnBook(book: Book) {
        guard let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) else {
            print("\(name) ეს წიგნი არ უთხოვნია.")
            return
        }
        
        borrowedBooks.remove(at: index)
        book.bookReturned()
    }
}

/* 3.
 შევქმნათ Class Library
 Properties: Books Array, Owners Array.
 Designated Init.
 Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
 Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
 Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
 Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
 Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
 Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
 Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
 */

class Library {
    var books: [Book]
    var owners: [Owner]

    init() {
        self.books = []
        self.owners = []
    }

    // წიგნის დამატება.
    func addBook(book: Book) {
        self.books.append(book)
    }

    // Owner-ის დამატება
    func addOwner(owner: Owner) {
        self.owners.append(owner)
    }

    // ყველა ხელმისაწვდომი წიგნი.
    func availableBooks() -> [Book] {
        return books.filter { !$0.isBorrowed }
    }

    // ყველა borrowed წიგნი.
    func listBorrowedBooks() -> [Book] {
        return books.filter { $0.isBorrowed }
    }

    // ძიება ID'ს მიხედვით.
    func findOwner(byId ownerId: Int) -> Owner? {
        return owners.first { $0.ownerId == ownerId }
    }

    // ძიება Owner-ის მიხედვით.
    func findBorrowedBooks(byOwner owner: Owner) -> [Book] {
        return owner.borrowedBooks
    }

    func borrowBook(bookId: Int, byOwner ownerId: Int) {
        guard let book = books.first(where: { $0.bookID == bookId && !$0.isBorrowed }) else {
            print("წიგნი ხელმისაწვდომი არაა, იმისათვის რომ ითხოვოთ.")
            return
        }
        guard let owner = findOwner(byId: ownerId) else {
            print("Owner ვერ მოიძებნა.")
            return
        }
        owner.borrowBook(book: book)
    }
}

/* 4.
 გავაკეთოთ ბიბლიოთეკის სიმულაცია.
 შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
 დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
 წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
 დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
 */

let book1 = Book(bookID: 1, title: "how too be lamara.", author: "(Lamara deida)")
let book2 = Book(bookID: 2, title: "Tengo in action", author: "(Tengizi bidzia)")
let book3 = Book(bookID: 3, title: "popurebi da qeipebi", author: "(Dato Gomarteli)")

let owner1 = Owner(ownerId: 1, name: "Owner Name: Jumberi")
let owner2 = Owner(ownerId: 2, name: "Owner Name: Gela")

//library.

let library = Library()
library.addBook(book: book1)
library.addBook(book: book2)
library.addBook(book: book3)

library.addOwner(owner: owner1)
library.addOwner(owner: owner2)

// წიგნების წაღება და დაბრუნება

owner1.borrowBook(book: book1)
owner2.borrowBook(book: book2)

// Owner:

owner1.returnBook(book: book1) // აქ ლამარას წიგნი დაბრუნდა შესაბამისად Available: ისევ ლამარა და დათო გომართელია. თენგო არ დაიპრინტება.

// ეს წიგნები გვაქვს.

print("Available 📚:")
for book in library.availableBooks() {
    print("- \(book.title) by \(book.author)")
}

// წიგნები, რომლებიც გაცემულია.

print("\nBorrowed 📚:")
for book in library.listBorrowedBooks() {
    print("- \(book.title) by \(book.author)")
}

print("\nBooks Borrowed by Gela:")
for book in owner2.borrowedBooks {
    print("- \(book.title) by \(book.author)")
}


//MARK: - არასავალდებულო ამოცანები.

/*
 შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია. შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან.
 */

class ExpressionGenerator {
    var expressions: [String]

    init(expressions: [String]) {
        self.expressions = expressions
    }

    func addExpression(newExpression: String) {
        expressions.append(newExpression)
    }

    func removeExpression(expressionToRemove: String) {
        expressions = expressions.filter { $0 != expressionToRemove }
    }

    func showRandomExpression() {
        guard !expressions.isEmpty else {
            print("No expressions available.")
            return
        }
        if let randomExpression = expressions.randomElement() {
            print(randomExpression)
        }
    }
}

let killerExpressions = [
    "დავინახე თუ არა მივხვდი, რომ – 'დევიღუპე.'",
    "ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად",
    "სულის ტკივილამდე ვტკივილობ…",
    "იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ",
    "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ",
    "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე",
    "თქვენ მოჰკალით ძერა?",
    "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...",
    "მზე აღარ ამოდის ჩაგვიჭრეს"
]

let generator = ExpressionGenerator(expressions: killerExpressions)

generator.addExpression(newExpression: "ცხოვრება წიგნია, თითოეული გვერდი ახალი თავი.")
generator.removeExpression(expressionToRemove: "მზე აღარ ამოდის ჩაგვიჭრეს")

generator.showRandomExpression()
