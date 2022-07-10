/*
 클로저 표현 (Closure Expressions)
 */

// 정렬 메소드 (The Sorted Method)

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

// 클로저 표현 문법 (Closure Expression Syntax)
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
// 문맥에서 타입 추론 (Inferring Type From Context)
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
// 단일 표현 클로저에서의 암시적 반환 (Implicit Returns from Single-Express Closures)
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
// 인자 이름 축약 (Shorthand Arguments Names)
reversedNames = names.sorted(by: { $0 > $1 })
// 연산자 메소드 (Operator Methods)
reversedNames = names.sorted(by: >)

/*
 후위 클로저 (Trailing Closures)
 */
reversedNames.sorted() { $0 > $1 }
reversedNames.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

/*
 값 캡쳐 (Capturing Values)
 */

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

/*
 클로저는 참조 타입 (Closures Are Reference Types)
 */
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

/*
 이스케이핑 클로저 (Escaping Closures)
 */
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)


print(completionHandlers)
completionHandlers.first?()
print(instance.x)

/*
 자동클로저 (Autoclosures)
 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)



func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))



var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}

