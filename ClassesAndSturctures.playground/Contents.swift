/*
 클래스와 구조체의 비교 (Comparing Classes and Structures)
 */
// 선언 문법 (Definition Syntax)
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// 클래스와 구조체 인스턴스 (Class and Structure Instances)

let someResolution = Resolution()
let someVideoMode = VideoMode()

// 프로퍼티 접근 (Accessing Properties)
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// 구조체형의 맴버 초기화 (Memberwise Initializers for Structure Types)
let vga = Resolution(width: 640, height: 480)

/*
 구조체와 열거형은 값 타입 (Structures and Enumerations Are Value Types)
 */
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")

enum CompassPoint {
    case north, south, east, west
}


var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered direction is still .west")
}

/*
 클래스는 참조 타입 (Classes Are Reference Types)
 */
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// 식별 연산자 (Identity Operators)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

