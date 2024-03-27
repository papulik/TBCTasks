import Foundation

//MARK: - არასავალდებულო ამოცანები.

// 1. შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)

enum Gender {
    case male
    case female
}

// 2. შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender

protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int? { get } // სრული თავისუფლების მიზნით, optional :)
    var weakness: String { get }
    var gender: Gender { get }
}

// 3. SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა

extension SuperBeing {
    var strength: Int {
        18
    }
    
    var speed: Int? {
        11
    }
}

// 4. შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.

class SuperHero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var speed: Int? // Optional იმიტორო მეორე ინიტიც მინდა არასავალდებულო დავალებებისთვის. 🫣 overrideing-ს ვუკეთებ Default Values რო არასავალდებულო ამოცანა კარგად ამოიხსნას.
    
    // 5. გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String
    
    var outfitColor: String? // Optional იმიტორო მეორე ინიტიც მინდა არასავალდებულო დავალებებისთვის. 🫣
    var equipment: String?
    var vehicle: String?
    
    init(name: String, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    
    //init for არასავალდებულო ამოცანებისთვის.
    
    init(name: String, weakness: String, gender: Gender, speed: Int) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.speed = speed
    }
}

class SuperVillain: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    
    init(name: String, weakness: String, gender: Gender) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
    }
}

/* 6.
 გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
 “‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).
 */

extension SuperHero {
    func rescue(personName: String) {
        print("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(personName) გადაარჩინა სიკვდილს")
    }
}

/* 7.
 გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
 “‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)
 */

extension SuperHero {
    func combat(villain: SuperVillain) {
        print("\(name) შეერკინა და დაამარცხა \(villain.name)")
    }
}

// 8. გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String

extension SuperVillain { // მიზეზი თუ რატომ extension, იმიტორო ყველა ვილაინს ეს საკითხები ერთი და იგივე აქვთ. 🤌
    var evilScheme: String {
            "Destroy World"
        }
        
        var obsession: String {
            "Obsessed With Power"
        }
        
        var rivalry: String {
            "SuperHero"
        }
}

/* 9.
 გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
 “ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)
 */

extension SuperVillain {
    func attack(hero: SuperHero) {
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(hero.name) მის შეჩერებას თუ შეძლებს")
    }
}

/* 10.
 გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
 “‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)
 */

extension SuperVillain {
    func experimentation(subject: String) {
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა")
    }
}

// 11. შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან

// Heroes:
let batMan = SuperHero(name: "BatMan", weakness: "Slow Regeneration", gender: .male, outfitColor: "Black", equipment: "Spiked Fists", vehicle: "BatCar")
let superMan = SuperHero(name: "Superman", weakness: "Milk", gender: .male, outfitColor: "Red", equipment: "Nothing", vehicle: "Nothing")
let wonderWomen = SuperHero(name: "Wonder Women", weakness: "Nothing", gender: .female, outfitColor: "Red", equipment: "Shield", vehicle: "Nothing")
let spiderMan = SuperHero(name: "Peter Parker", weakness: "Emotions", gender: .male, outfitColor: "Red", equipment: "Web Louncher", vehicle: "Webs")
let DrStrange = SuperHero(name: "Stephen Vincent", weakness: "Silance", gender: .male, outfitColor: "Blue", equipment: "Magic", vehicle: "Cloak")

//Villains:
let thanos = SuperVillain(name: "Thanos", weakness: "OverConfidence", gender: .male)
let joker = SuperVillain(name: "Joker", weakness: "Ego", gender: .male)
let goblin = SuperVillain(name: "Norman Osbron", weakness: "Madness", gender: .male)
let loki = SuperVillain(name: "Loki", weakness: "Water", gender: .male)
let magneto = SuperVillain(name: "Magneto", weakness: "Plastic Bullets", gender: .male)

print(batMan.speed ?? 0) // prints 0 იმიტორო superHero class - ში, speed overrideing გავუკეთე და აქ ინიციალიზებული არ არის/ optional დავალების გამო.
batMan.combat(villain: joker)
batMan.rescue(personName: "ლამარა")

print(thanos.evilScheme)
print(thanos.strength)
thanos.experimentation(subject: "თენგიზი")
thanos.attack(hero: DrStrange)

//MARK: - არასავალდებულო ამოცანები.

/* პირობა :
 წარმოიდგინეთ სცენა სადაც ორი სუპერგმირი - დრეიკი და ლექს-სენი ერთმანეთს ეჯიბრებიან თუ რომელი უფრო სწრაფია. დრეიკი ამბობს რომ ის ყველაზე სწრაფია მსოფლიოში და რიანაც უდასტურებს.
 -“ლექს-სენს არცერთი შეჯიბრი არ წაუგია ისტორიაში” აცხადებს მისი კოლაბორატორი თაკო და დასძენს, რომ დრეიკი შიშისაგან უნდა კანკალებდეს, რადგან არც კი იცის რა ელოდება. ამ სუპერგმირების ბედი თქვენზეა დამოკიდებული, თქვენ უნდა გადაწყვიტოთ ვინ არის მსოფლიოში ყველაზე სწრაფი და ვინ შეძლებს ბილბორდის ტოპ ჩარტების განადგურებას.
 */

// 1. დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს

func compareSwiftness<T: SuperBeing, U: SuperBeing>(firstSuperBeing: T, secondSuperBeing: U) -> String {
    /*
     2. ფუნქციის ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის
     3. დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია)
     */
    let firstSpeed = firstSuperBeing.speed ?? 0
    let secondSpeed = secondSuperBeing.speed ?? 0
    
    if firstSpeed > secondSpeed {
        return "\(firstSuperBeing.name) ყველაზე სწრაფია მსოფლიოში, დაჟე \(secondSuperBeing.name) -საც კი ეშინია და არ იცის რა ელოდება.."
    } else if secondSpeed > firstSpeed {
        return "\(secondSuperBeing.name) -ს არასდროს წაუგია შეჯიბრი, \(firstSuperBeing.name) -ს უნდა ეშინოდეს მისი."
    } else {
        return "\(firstSuperBeing.name) და \(secondSuperBeing.name) თანაბრად სწრაფიან."
    }
}

let drake = SuperHero(name: "Drake", weakness: "წიწაკა", gender: .male, speed: 22)
let lexSen = SuperHero(name: "Lex-Sen", weakness: "ხახლმრავლობა", gender: .male, speed: 11)

let result = compareSwiftness(firstSuperBeing: drake, secondSuperBeing: lexSen)
print(result)



