/*
 정의와 호출 (Defining and Calling Functions)
 */
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))


func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain(person: "Anna"))


/*
 함수 파라미터와 반환 값 (Function Parameters and Return Values)
 */
// 파라미터가 없는 함수 (Functions Without Parameters)
func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())


// 복수의 파라미터를 사용하는 함수 (Functions With Multiple Parameters)
func greet2(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet2(person: "Tim", alreadyGreeted: true))

// 반환 값이 없는 함수 (Functions Without Return Values)

func greet3(person: String) {
    print("Hello, \(person)!")
}

greet3(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// 복수의 값을 반환하는 함수
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// 옵셔널 튜플 반환형 (Optional Tuple Return Types)
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax2(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// 함수 인자 라벨과 파라미터 이름 (Function Argument Labels and Parameter Names)
func someFunction(firstParameterName: Int, secondParameterName: Int) {
}

someFunction(firstParameterName: 1, secondParameterName: 2)

func greet4(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

print(greet4(person: "Bill", from: "Cupertino"))

// 인자 생략 (Omitting Argument Labels)
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
}

someFunction(1, secondParameterName: 2)

// 기본 파라미터 값 (Default Parameter Values)
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
}

someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

// 집합 파라미터 (Variadic Parameters)
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)


// 인-아웃 파라미터 (In-Out Parameters)
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

/*
 함수 형 (Function Types)
 */
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("hello, world")
}

// 함수 형의 사용 (Using Function Types)
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
let anotherMathFunction = addTwoInts

// 파라미터 형으로써의 함수 형 (Function Types as Parameter Types)
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

// 반환 형으로써의 함수 형 (Function Types as Return Types)
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

/*
 중첩 함수 (Nested Functions)
 */
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }

    func stepBackward(input: Int) -> Int {
        return input - 1
    }

    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero는 이제 중첩 돼 있는 stepForward() 함수를 가르킵니다.
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


