import Foundation

//MARK: - სავალდებულო ამოცანები

// 1. while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.

var oddNum = 1
var product = 1

while oddNum <= 19 {
    product *= oddNum
    print(product)
    oddNum += 2
}

print("The product of all odd numbers from 1 to 20 is \(product)")

// 2. შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

var name: String = "Zuka"
var oppositeName: String = ""

for character in name {
    oppositeName = String(character) + oppositeName
}

print(oppositeName)

// 3. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."

//var currentLight = "Red"
//
//while currentLight != "" {
//
//    sleep(1)
//
//    switch currentLight {
//    case "Red":
//        print("🔴")
//        currentLight = "Yellow"
//    case "Yellow":
//        print("🌕")
//        currentLight = "Green"
//    case "Green":
//        print("🟢")
//        currentLight = "Red"
//    default:
//        print("Unknown state")
//        currentLight = "Red"
//    }
//
//}

// 4. Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”

var tickets = 5

print("საწყისი რაოდენობაა: \(tickets) ბილეთი, გთხოვთ იჩქაროთ ეს ბოლო შანსია !")

while tickets <= 5 && tickets > 0 {
    tickets -= 1
    if tickets > 0 {
        print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(tickets) რაოდენობა") // This will print as long as tickets is more than 0
    } else {
        print("მეგობრებო ყველა ბილეთი გაყიდულია, გელოდებით კონცერტზე ! 🪩🕺") // This will print when tickets becomes 0
    }
}

// 5. შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

// ამოხსნა Set-ის გარეშე, გამოწვევა იყო 😅.

let array = [1, 2, 3, 4, 5, 4]

func isElementUnique(element: Int, array: [Int]) -> Bool {
    var count = 0
    for item in array {
        if item == element {
            count += 1
            if count > 1 {
                return false
            }
        }
    }
    return true
}

var allElementsAreUnique = true

for element in array {
    if !isElementUnique(element: element, array: array) {
        allElementsAreUnique = false
        break
    }
}

if allElementsAreUnique {
    print("array-ში ყველა ელემენტი განსხვავებულია")
} else {
    print("array შეიცავს მსგავს ელემენტებს")
}

// 6. დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას

let someClosure: (Int, Int) -> Int = { (num1, num2) -> Int in
    
    return num1 - num2
}

someClosure(5, 2)

//7. დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.

let specialCharacters: [Character] = ["ბ","გ","დ","ვ","ზ","თ","კ","ლ","მ","ნ","პ","ჟ","რ","ს","ტ","ფ","ქ","ღ","ყ","შ","ჩ","ც","ძ","წ","ხ","ჭ","ჯ","ჰ"]
var dummyArray: [Character] = []

func countSpecialCharacters(str: String) -> (Int, [Character]) {
    var count = 0
    var countedCharacters: [Character] = []

    for char in str {
        dummyArray.append(char)
    }

    for char in dummyArray {
        if specialCharacters.contains(char) && !countedCharacters.contains(char) {
            count += 1
            countedCharacters.append(char)
        }
    }

    return (count, countedCharacters)
}

let inputString = "გამარჯობა" // გთხოვთ ჩაწეროთ მხოლოდ ქართული სიტყვები, ინგლისურზე ხმოვნების მასივი არ შემიქმნია 😬.
let (specialCharacterCounts, countedCharacters) = countSpecialCharacters(str: inputString)
print("ამ სიტყვაში არის: \(specialCharacterCounts) თანხმოვანი.")
print("თანხმოვნები, რომლებიც ამ სიტყვაშია გამოკვეთილი: \(countedCharacters)")


//MARK: - არასავალდებულო ამოცანები.

// 1. შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.

func mergeArrays(array1: [Int], array2: [Int]) -> [Int] {
    return array1 + array2
}

func bubbleSort(array: inout [Int]) {
    var didSwap: Bool
    
    for i in 0..<array.count {
        didSwap = false
        
        for num in 1..<array.count-i {
            if array[num - 1] > array[num] {
                let temp = array[num - 1]
                array[num - 1] = array[num]
                array[num] = temp
                didSwap = true
            }
        }
        
        if !didSwap {
            break
        }
    }
}

var numberArray1 = [8, 4, 9, 9, 0, 2]
var numberArray2 = [1, 0, 9, 2, 3, 7, 0, 1]

var mergedArray = mergeArrays(array1: numberArray1, array2: numberArray2)

bubbleSort(array: &mergedArray)

print(mergedArray)

// 2. დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ

func factorial(of number: Int) {
    if number > 20 {
        print("Memory issue warning: The input is too large for safe factorial calculation.")
        return // ფუნქციიდან ნაადრევად გამოსვლა, 20-ის ზევით მემორი იტვირთება და აგდებს ერრორს.
    }
    
    var result = 1
    for i in 1...number {
        result *= i
    }
    print("The factorial of \(number) is \(result) 👨‍🔬")
}

let number = 20 // რეკომენდაცია: სატესტოდ, გთხოვთ გამოიყენოთ რიცხვები 20-ის დაბლა.
factorial(of: number)

// 3. შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.

var arrayNum = [0,1,2,3,4,5,6,7,8,9,10]
var oddArray: [Int] = []
var evenArray: [Int] = []

func arrayDivider(array: [Int]) {
    
    for num in array {
        if num % 2 == 0 {
            evenArray.append(num)
        } else {
            oddArray.append(num)
        }
    }
}

arrayDivider(array: arrayNum)
print(evenArray)
print(oddArray)
