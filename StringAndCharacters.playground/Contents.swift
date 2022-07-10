/*
 문자열 리터럴
 */
let something = "Some string literal value"

// 여러줄 문자열 리터럴
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

// 문자열 리터럴의 특수 문자
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollaSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

/*
 빈 문자열 초기화
 */
var emtptyString = ""
var anotherEmptyString = String()
if emtptyString.isEmpty {
    print("Nothing to see here")
}

// 문자열 수정
var variableString = "Horse"
variableString += " and carriage"
// variableString = Horse and carriage

let constantString = "Highlander"
//constantString += " and another Highlander"

/*
 문자
 */
for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

/*
 문자열과 문자의 결합
 */
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)

/*
 문자열 삽입
 */
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

/*
 유니코드
 */
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
print(greeting.startIndex, greeting.endIndex)
//greeting[greeting.endIndex]
//greeting.index(after: greeting.endIndex)
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

// 문자의 삽입과 삭제
var welcomee = "hello"
welcomee.insert("!", at: welcomee.endIndex)

welcomee.insert(contentsOf: " there", at: welcomee.index(before: welcomee.endIndex))
welcomee.remove(at: welcomee.index(before: welcomee.endIndex))

let range = welcome.index(welcomee.endIndex, offsetBy: -6)..<welcomee.endIndex
welcomee.removeSubrange(range)

/*
 부분 문자열
 */
let greetingg = "Hello, World!"
let indexx = greetingg.index(of: ",") ?? greetingg.endIndex
let beginning = greetingg[..<indexx]

let newString = String(beginning)

// 문자열과 문자 비교
let quotationn = "We're a lot alike, you and I."
let sameQuotation = "We're a lost alike, you and I."
if quotationn == sameQuotation {
    print("These two strings are considered equal")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}

// 접두사와 접미사 비교
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

/*
 문자열의 유니코드 표현
 */
let dogString = "Dog!!🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
