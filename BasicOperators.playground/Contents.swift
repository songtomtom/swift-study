/*
 할당 연산자(Assignment Operator)
 */
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

/*
 사칙 연산자(Arithmetic Operators)
 */
print(1 + 2)
print(5 - 3)
print(2 * 3)
print(10.0 / 2.5)

print("hello " + "world")

// 나머지 연산자(Remainder Operator)
print(9 % 4)
print(-9 % 4)

// 단항 음수 연산자(Unary Minus Operator)
let three = 3
let minusThree = -three
let plusThree = -minusThree

let minusSix = -6
// 단항 양수 연산자(Unary Plus Operator)
//let alsoMinusSix = +minusSix

/*
 합성 할당 연산자 (Compound Assignment Operators)
 */
var aa = 1
aa += 2

/*
 비교 연산자(Comparison Operators)
 */
print(1 == 1)
print(2 != 1)
print(2 > 1)
print(1 < 2)
print(1 >= 1)
print(2 <= 1)

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
("blue", -1) < ("purple", 1)
//("blue", false) < ("purple", true)

/*
 삼항 조건 연산자(Ternary Conditional Operator)
 */
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

print(rowHeight)

let rowHeight2: Int
if hasHeader {
    rowHeight2 = contentHeight + 50
} else {
    rowHeight2 = contentHeight + 20
}

/*
 Nil 병합 연산자(Nil-Coalescing Operator)
 */
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

/*
 범위 연산자(Range Operators)
 */

// 닫힌 범위 연산자(Closed Range Operator)

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// 반 닫힌 범위 연산자(Half-Open Range Operator)
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")

}

// 단방향 범위(One-Side Ranges)

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

let range = ...5

range.contains(7)
range.contains(4)
range.contains(-1)

print(range)

/*
 논리 연산자(Logical Operators)
 */
// 논리 부정 연산자(Logical NOT Operator)
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

// 논리 곱 연산자(Logical AND Operator)
let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome")

} else {
    print("ACCESS DENIED")

}

// 논리 합(OR) 연산자(Logical OR Operator)
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// 논리 연산자의 조합(Combining Logical Operators)
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// 명시적 괄호(Explicit Parentheses)
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
