import UIKit

// 1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.

var number1 = 1
var number2 = 2
var number3 = 3

var multipliedNumber = number1 * number2 * number3

print(multipliedNumber)

// 2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.

var intNumber: Int = 6

let oddOrEvenNumber = intNumber % 2 == 0 ? "ლუწი" : "კენტი"

print(oddOrEvenNumber)

// 3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ

let name: String?

name = "zuka"

if let name = name {
    print(name)
}

// 4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.

var isRaining: Bool

isRaining = false

if isRaining == true {
    print("ქოლგის წაღება არ დამავიწყდეს ☔️")
} else {
    print("დღეს ქოლგა არ დამჭირდება 🌂")
}

// 5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”

var a = 30
var b = 25

if a > b {
    print("a მეტია")
} else {
    print("b მეტია")
}

// 6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.

let constant: Character = "Z"

print(constant)

// 7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი.

var numberWithSameDigits = 222

if numberWithSameDigits >= 10 && numberWithSameDigits < 100 { // ვამოწმებთ, რომ რიცხვი იყოს ორ ციფრა :)
    if numberWithSameDigits % 10 == numberWithSameDigits / 10 {
        print("True - რიცხვს აქვს ერთნაირი ციფრები.")
    } else {
        print("False - რიცხვს აქვს სხვადასხვა ციფრები.")
    }
} else {
    print("ზდექ ! რიცხვი ორ ნიშნა არ არის! ✋🧐, გთოხვთ ჩაწეროთ ცვლადში მხოლოდ ორ ნიშნა 😌")
}

// 8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.

var numberOfMonths = 3

if numberOfMonths >= 3 && numberOfMonths <= 5 {
    print("გაზაფხული")
} else if numberOfMonths >= 6 && numberOfMonths <= 8 {
    print("ზაფხული")
} else if numberOfMonths >= 9 && numberOfMonths <= 11 {
    print("შემოდგომა")
} else if numberOfMonths == 12 || (numberOfMonths >= 1 && numberOfMonths <= 2) {
    print("ზამთარი")
} else {
    print("არასწორი თვის ნომერი ‼️")
}

// 9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”

var number = 12

if number % 3 == 0 && number % 4 == 0 {
    print("იყოფა 3-ზე და 4-ზე")
} else if number % 3 == 0 {
    print("იყოფა 3-ზე")
} else if number % 4 == 0 {
    print("იყოფა 4-ზე")
} else {
    print("არ იყოფა არც 3-ზე, არც 4-ზე")
}

// 10. შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი

var num1 = 11
var num2 = -11

var distance1 = num1
var distance2 = num2

if num1 < 0 {
    distance1 = -num1
}

if num2 < 0 {
    distance2 = -num2
}

let result = distance1 == distance2 ? "თანაბრად დაშორებულია ნულიდან" : "არ არის თანაბრად დაშორებული ნულიდან"

print(result)


func performDelayedAction(with closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        closure()
    }
    
    print("🟢")
}

// Usage:
performDelayedAction {
    print("This message is delayed by 2 seconds.")
}
