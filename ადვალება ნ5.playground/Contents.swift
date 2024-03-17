import Foundation

//MARK: - სავალდებულო ამოცანები

// 1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)

let palindromeText = "airevi iveria"

func isPalindrome(text: String) -> Bool {
    
    if text == String(text.reversed()) {
        return true
    } else {
        return false
    }
}

print(isPalindrome(text: palindromeText))

// 2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

func squearing(array: [Int]) -> [Int] {
    
    var squaredNumber = array.map { element in
        element * element
    }
    
    return squaredNumber
}

let printArray = squearing(array: [2,4,6])

print(printArray)

// 3. დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.

var filteringClosure: ([Int]) -> [Int] = { evenNumbers -> [Int] in
    var filteredArray = evenNumbers.filter { number in
        number % 2 == 0
    }
    return filteredArray
}

let result = filteringClosure([2,4,6,5,7,8])
print(result)

// 4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.

func printArraySumAfterDelay(array: [Int], completed: @escaping () -> Void) {
    let sum = array.reduce(0, +)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        print("მასივის ჯამია: \(sum)")
        completed()
    }
    
    print("🔴🔴Testing🔴🔴")
}


printArraySumAfterDelay(array: [1, 2, 3, 4, 5]) {
    print("🟢🟢Success🟢🟢")
}

// 5. შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი

var contactsList: [String: Int] = [:]

func addNumber(name: String, number: Int) {
    let numberString = String(number) //numberString ვიყენებ იმისათვის, რომ ნომრები იყოს 9 ნიშნა. ეს ამოცანის მოთხოვნა არაა.
    
    if numberString.count == 9 {
        contactsList[name] = number
        print("\(name) წარმატებით დაემატა ✅.")
    } else {
        print("ნომერი უნდა შედგებოდეს 9 ნიშნისგან, გთხოვთ შეიყვანოთ 9 ნიშნა ნომერი 🧐.")
    }
}

func findContact(name: String) {
    if let number = contactsList[name] {
        print("\(name): \(number)")
    } else {
        print("\(name) - ამ სახელით ნომერი ვერ მოიძებნა, სცადეთ კიდევ ერთხელ.")
    }
}

func deleteContact(name: String) {
    if let _ = contactsList.removeValue(forKey: name) {
        print("\(name) - წარმატებით წაიშალა.")
    } else {
        print("\(name) - ამ სახელით ნომერი ვერ მოიძებნა რომ წაიშალოს 🕵️‍♂️.")
    }
}

addNumber(name: "zuka", number: 599256060)
addNumber(name: "ana", number: 599111111)

findContact(name: "zuka")

deleteContact(name: "zuka")

// 6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.

func sortedKeys(from dictionary: [String: Int]) -> [String] {
    let sortedKeys = dictionary.keys.sorted()
    return sortedKeys
}

let contacts: [String: Int] = ["ზუკა:": 239048, "ანი": 5551234, "ლადო": 5555678, "ალეკო": 5550000]
let sortedContactKeys = sortedKeys(from: contacts)
print(sortedContactKeys)

// 7. შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.

var numbers: [Double] = [33.3, 22.5, 11.0, 234,4, 43.6, 234.8]

var maxNumber = numbers[0]
for number in numbers {
    if number > maxNumber {
        maxNumber = number
    }
}

print("The largest number is \(maxNumber)")

//MARK: - არასავალდებულო ამოცანები

// მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:

let lelaWhatMovementIsThis: [String: Int] = [
    
    "ღამის სიჩუმე გაფანტე": 235,
    
    "ვიხსენებ ყველაფერს თავიდან": 219,
    
    "სულელი წვიმა": 231,
    
    "ალალ მე": 231,
    
    "იდუმალი ღამე": 221,
    
    "ჩუმად ნათქვამი": 199,
    
    "თეთრი ქარავანი": 221,
    
    "ძველი ვერხვები": 193
    
]

// 1. დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიმღერების ჯამურ ხანგრძლივობას წუთებში და წამებში

var sum = 0

func songTimer() {
    for (_, time) in lelaWhatMovementIsThis {
        sum += time
    }
    print("წამები: \(sum)")
    print("წუთები: \(sum / 60)")
}

songTimer()

// 2. დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.

func shortestAndLongestMusicNames() {
    
    if lelaWhatMovementIsThis.isEmpty {
        print("The dictionary is empty.")
        return
    }
    
    var shortestTime = Int.max
    var longestTime = Int.min
    var shortestSong = ""
    var longestSong = ""
    
    for (song, duration) in lelaWhatMovementIsThis {
        
        if duration < shortestTime {
            shortestTime = duration
            shortestSong = song
        }
        
        if duration > longestTime {
            longestTime = duration
            longestSong = song
        }
    }
    
    print("Shortest song: \(shortestSong) with duration: \(shortestTime) seconds")
    print("Longest song: \(longestSong) with duration: \(longestTime) seconds")
}

shortestAndLongestMusicNames()


// 3. დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას.

func avarageSongTime() {
    var lelaBecomesAnArray = lelaWhatMovementIsThis.values.sorted()
    let avarageTime = Double(sum) / Double(lelaBecomesAnArray.count)
    print(avarageTime)
}

avarageSongTime()

// 4. დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს.

func randomSong() {
    if let randomSongAndTime = lelaWhatMovementIsThis.randomElement() {
        let songName = randomSongAndTime.key
        let songDuration = randomSongAndTime.value
        print("Random song: \(songName) with duration: \(songDuration) seconds")
    } else {
        print("The dictionary is empty.")
    }
}

randomSong()
