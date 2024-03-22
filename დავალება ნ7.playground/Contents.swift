import Foundation

//MARK: - სავალდებულო ამოცანები.

// 1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

func dayOff(day: WeekDay) {
    
    if day == .Saturday || day == .Sunday {
        print("გილოცავ დასვენების დროა !")
    } else {
        print("უნდა იმუშაო სხვა გზა არაა  👷.")
    }
}

dayOff(day: .Friday)
dayOff(day: .Sunday)

// 2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialaSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio
    
    var pricesForGialaModes: Int {
        switch self {
        case .TsigroviManto:
            return 400
        case .MoshishvlebuliMkerdi:
            return 200
        case .TuGapatio:
            return 100
        }
    }
    
    func prices() {
        switch self {
        case .TsigroviManto:
            print("TsigroviManto - ის ფასი არის: \(pricesForGialaModes)")
        case .MoshishvlebuliMkerdi:
            print("MoshishvlebuliMkerdi - ის ფასი არის: \(pricesForGialaModes)")
        case .TuGapatio:
            print("TuGapatio - ის ფასი არის: \(pricesForGialaModes)")
        }
    }
}

let member = GialaSquad.TuGapatio
member.pricesForGialaModes
member.prices()

// 3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case sunny(celsius: Double)
    case Cloudy(celsius: Double)
    case Rainy(celsius: Double)
    case Snowy(celsius: Double)
}

func weatherChecker(weather: Weather) {
    switch weather {
    case .sunny(let temp):
        print("დღეს ამინდის მიხედვით გვაქვს: \(temp) გრადუსი, მზიანი ამინდი გვთავაზობს ჩავიცვათ მოკლემკლავიანი.")
    case .Cloudy(let temp):
        print("დღეს ამინდის მიხედვით გვაქვს: \(temp) გრადუსი, მოღრუბლული ამინდი გვთავაზობს რამე ჟაკეტი.")
    case .Rainy(let temp):
        print("დღეს ამინდის მიხედვით გვაქვს: \(temp) გრადუსი, წვიმიანი ამინდი გვთავაზობს ჩავიცვათ საწვიმარი")
    case .Snowy(let temp):
        print("დღეს ამინდის მიხედვით გვაქვს: \(temp) გრადუსი, თოვლიანი ამინდი გვთავაზობს ჩავიცვათ დუტის კურტკა!")
    }
}

let currentWeather = Weather.Snowy(celsius: 18.5)
weatherChecker(weather: currentWeather)

// 4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    var album: String
    var releaseYear: Int
}

var kanyeArray: [Kanye] = []

let kanye1 = Kanye(album: "FirstAlbum", releaseYear: 1993)
let kanye2 = Kanye(album: "Super", releaseYear: 2001)
let kanye3 = Kanye(album: "Duper", releaseYear: 2007)

kanyeArray += [kanye1, kanye2, kanye3]

func kanyeAlbums(kanye: [Kanye], year: Int) {
    let albumsAfterYear = kanye.filter { $0.releaseYear > year }
    
    if albumsAfterYear.isEmpty {
        print("\(year) ამ წლის შემდეგ ალბომები აღარ გამოსულა.")
    } else {
        print("\(year) ამ წლის შემდეგ გამოშვებული ალბომებია:")
        for album in albumsAfterYear {
            print("\(album.album) (\(album.releaseYear))")
        }
    }
}

kanyeAlbums(kanye: kanyeArray, year: 2000)

// 5. შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct CachedData {
    lazy var value: String = self.initializer()
    let initializer: () -> String
    
    init(wrappedValue initializer: @escaping @autoclosure () -> String) {
        self.initializer = initializer
    }
    
    var wrappedValue: String {
        mutating get {
            value
        }
        set {
            value = newValue
        }
    }
}

struct Example {
    @CachedData var cachedData: String = "lazy ინიციალიზებულია"
}

var example = Example()
print(example.cachedData)

//MARK: - არასავალდებულო ამოცანები

// შექმენით Enum სახელად TarotCard და განსაზღვრეთ მასში 12 კარტის ქეისი.

enum TarotCard {
    case Star
    case Empress
    case Tower
    case HangedMan
    case Chariot
    case Moon
    case Hierophant
    case Devil
    case Lovers
    case WheelOfFortune
    case Fool
    case Magician
    
    // შექმენით სტატიკური მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტს შერჩევითად
    
    static let allCards = [Star, Empress, Tower, HangedMan, Chariot, Moon, Hierophant, Devil, Lovers, WheelOfFortune, Fool, Magician]
    
    static func tarotCardSelector() -> TarotCard {
        let randomCard = allCards.randomElement()
        
        return randomCard!
    }
    // შექმენით მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტის აღწერას string-ის სახით
    
    func tarotCardStory() -> String {
        switch self {
        case .Star:
            "Star: წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
        case .Empress:
            "Empress: განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში."
        case .Tower:
            "Tower: ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის."
        case .HangedMan:
            "Hanged Man: წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს."
        case .Chariot:
            "Chariot: განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით."
        case .Moon:
            "Moon: აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს."
        case .Hierophant:
            "Hierophant: წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან."
        case .Devil:
            "Devil: განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას."
        case .Lovers:
            "Lovers: აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით."
        case .WheelOfFortune:
            "Wheel of Fortune: წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია."
        case .Fool:
            "Fool: განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას."
        case .Magician:
            "Magician: აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით."
        }
    }
}

TarotCard.tarotCardSelector()
let tarot = TarotCard.Chariot
print(tarot.tarotCardStory())

// შექმენით სტრუქტურა სახელად TarotReading. გაუწერეთ ფროფერთიები წარსული, აწმყო და მომავალი. გაუკეთეთ ინიციალიზაცია ამ ფროპერთიებს რათა მათ მიიღონ შერჩევითი ტაროს კარტის აღწერის მნიშვნელობა.

struct TarotReading {
    let past: String
    let present: String
    let future: String
    
    init() {
        self.past = TarotCard.tarotCardSelector().tarotCardStory()
        self.present = TarotCard.tarotCardSelector().tarotCardStory()
        self.future = TarotCard.tarotCardSelector().tarotCardStory()
    }
    
    // შექმენით მეთოდი TarotReading-ში, რომელიც დაბეჭდავს ამ სამ არჩეულ ტაროს კარტს.
    
    func printReading() {
        print("Past: \(past)")
        print("Present: \(present)")
        print("Future: \(future)")
    }
}

let read = TarotReading()
print("Past: \(read.past)")
print("Present: \(read.present)")
print("Future: \(read.future)")

