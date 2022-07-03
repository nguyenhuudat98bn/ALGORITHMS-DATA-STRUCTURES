import UIKit
import QuartzCore
import Foundation
import Darwin


//var greeting = "Hello, playground"

extension Array where Element == Int {
    func startWithZero() -> Bool {
        guard self.count > 0 else {return false}
        return self.first == 0 ? true : false
    }
}

public final class BenchTimer {
    // @inline(__always) optimizes for speed by telling the compiler to always inline the method, if possible
    @inline(__always) public static func measureBlock(executionCount: UInt = 10, closure: () -> Void) -> CFTimeInterval {
        var executionTimes: Double = 0
        for _ in 0..<executionCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            executionTimes += (endTime - startTime)
        }
        return executionTimes / Double(executionCount)
    }
}

public extension CFTimeInterval {
    var formattedTime: String {
        return self >= 1000 ? String(Int(self)) + "s"
            : self >= 1 ? String(format: "%.3gs", self)
            : self >= 1e-3 ? String(format: "%.3gms", self * 1e3)
            : self >= 1e-6 ? String(format: "%.3gµs", self * 1e6)
            : self < 1e-9 ? "0s"
            : String(format: "%.3gns", self * 1e9)
    }
}

//func startWithZero(array: [Int]) -> Bool {
//    guard array.count != 0 else {
//        return false
//    }
//    return array.first == 0 ? true : false
//}
//
//var arr = Array(0...10)
//
//
//
//func generateRamdomArray(size: Int, maxValue: UInt32) -> [Int] {
//    guard size > 0 else { return [Int]()}
//    var result = [Int](repeating: 0, count: size)
//    for i in 0..<size {
//        result[i] = Int(arc4random_uniform(maxValue))
//    }
//
//    return result
//}
//
//func sum(arr:[Int]) -> Int {
//    var result = 0
//    for i in arr {
//        result += i
//    }
//    return result
//}
//
var excTime: CFTimeInterval = 0
//excTime = BenchTimer.measureBlock {
//    _ = sum(arr: generateRamdomArray(size: 10, maxValue: 100))
//}
//
//print(excTime)
//
//excTime = BenchTimer.measureBlock {
//    _ = sum(arr: generateRamdomArray(size: 1000, maxValue: 10000))
//}
//
//print(excTime)
//
//excTime = BenchTimer.measureBlock {
//    _ = generateRamdomArray(size: 1000, maxValue: 10000).reduce(0, +)
//}
//
//print(excTime)
//
//func getMultiplicationTable(size: Int) -> [Int] {
//    var multiplicationTable: [Int] = []
//    for i in 1...size {
//        for j in 1...size {
//            multiplicationTable.append(i * j)
//        }
//    }
//    return multiplicationTable
//}
//
//excTime = BenchTimer.measureBlock {
//    _ = getMultiplicationTable(size: 10)
//}
//
//print(getMultiplicationTable(size: 10))
//
//print(excTime)
//

//class Note {
//    var next: Note?
//    var value: String?
//
//    init(value: String) {
//        self.value = value
//    }
// }
//
//let note1 = Note(value: "Note1")
//let note2 = Note(value: "Note2")
//let note3 = Note(value: "Note3")
//
//note1.next = note2
//note2.next = note3
//note3.next = nil
//
//func paserNotes(note: Note?) {
//    guard let validNote = note else {
//        return
//    }
//    print(validNote.value)
//    paserNotes(note: validNote.next)
//}
//
//paserNotes(note: note1)


//func factorial1(n: UInt) -> UInt {
//    return (n < 2) ? 1 : n * factorial1(n: n - 1)
//}
//
//excTime = BenchTimer.measureBlock {
//    _ = factorial1(n: 10)
//}
//
//print(excTime)
//
//
//func factorial(n: UInt) -> UInt {
//    var result = 1
////    guard n < 2 else {return UInt(result)}
//
//    for i in 1...n {
//        result *= Int(i)
//    }
//    print(result)
//    return UInt(result)
//
//}
//
//excTime = BenchTimer.measureBlock {
//    _ = factorial(n: 10)
//}
//
//print(excTime)


//func sum(from: Int ,to: Int) -> Int {
//    guard to > from else {return 0}
//    var result = 0
//    for i in from...to {
//        result += i
//    }
//
//    return result
//}
//
//excTime = BenchTimer.measureBlock {
//    print(sum(from: 1, to: 1000000))
//}
//print(excTime)

//func sumOptimized(from: Int, to: Int) -> Int {
//    guard to > from else {
//        return 0
//    }
//
//    return to * (to + 1) / 2
//}
//
//excTime = BenchTimer.measureBlock {
//    _ = sumOptimized(from: 1, to: 10000000)
////    print(sumAlgothirm(from: 1, to: 100))
//}
//print(excTime)

//print(sumAlgothirm(from: 1, to: 100))

//let arr = [0,1,2,2,3,4,5,2,1]
//
//func findTwoSum(_ array: [Int], target: Int) -> [(Int, Int)]? {
//    guard array.count > 1 else {
//        return nil
//    }
//
//    var arr: [(Int, Int)] = []
//    for i in 0..<array.count {
//        let left = array[i]
//        for j in (i + 1)..<array.count {
//            let right = array[j]
//            if (right + left == target) {
//                arr.append((left, right))
//            }
//        }
//    }
//    guard arr.count < 0 else {return arr}
//    return nil
//}
//
//excTime = BenchTimer.measureBlock {
//    print(findTwoSum(arr, target: 4))
//}

//func findTwoSumOpimized(_ array: [Int], target: Int) -> (Int, Int)? {
//    guard array.count > 1 else {return nil}
//    var diffs = Dictionary<Int, Int>()
//    for i in 0..<array.count {
//        let left = array[i]
//        let right = target - left
//        if let foundIndex = diffs[right] {
//            return (foundIndex,i)
//        } else {
//            diffs[left] = i
//        }
//    }
//    return nil
//}
//
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var dict:[Int:Int] = [:]
//
//    for i in 0..<nums.count {
//        if dict[target - nums[i]] != nil {
//            return [dict[target - nums[i]] ?? 0, i]
//        } else {
//            dict[nums[i]] = i
//        }
//    }
//
//    return [0]
//}
//
//print(twoSum(arr, 4))
//
//print(findTwoSumOpimized(arr, target: 4))


//var numbers = [45, 73, 195, 53]
//
//for i in 0..<numbers.count {
//    var newNumber = numbers
//    newNumber.remove(at: i)
//    numbers[i] = newNumber.reduce(0, +)
//}
//
//print(numbers)

//func mutipbleElement() -> [Int] {
//    var newArr = numbers
//    for i in 0..<newArr.count {
//        if (i == newArr.count - 1) {
//            newArr[i] = newArr[i] * numbers[0]
//        } else {
//            newArr[i] = newArr[i] * newArr[i + 1]
//        }
//    }
//    return newArr
//}
//numbers.randomElement()
//print(numbers.randomElement())

//print(numbers.shuffled())


//let array = [-3, 2, -2, 1, -2]
//
//func equilibriumIndex(array: [Int]) -> [Int]? {
//    guard array.count > 1 else {
//        return nil
//    }
//
//    var arrEquilibrium: [Int] = []
//
//    for i in 0..<array.count {
//
//        var sumLeft = 0
//        var sumRight = 0
//        for elementLeft in 0..<i {
//            sumLeft += array[elementLeft]
//        }
//
//        for elmentRight in (i + 1)..<array.count {
//            sumRight += array[elmentRight]
//        }
//
//        if sumLeft == sumRight {
//            arrEquilibrium.append(i)
//        }
//
//    }
//    return arrEquilibrium.isEmpty ? nil : arrEquilibrium
//}
//
//print(equilibriumIndex(array: array))
//
//excTime = BenchTimer.measureBlock {
//    _ = equilibriumIndex(array: array)
//}
//
//print(excTime)
////let array = [-3, 2, -2, 1, -2]
//
//
//func equilibriumOptimized(_ number: [Int]) -> [Int]? {
//
//    var arrEquilibrium: [Int] = []
//    var sum = number.reduce(0, +)
//    var leftSum = 0
//
//    for i in 0..<number.count {
//        sum = sum - number[i]
//
//        if sum == leftSum {
//            arrEquilibrium.append(i)
//        }
//
//        leftSum = leftSum + number[i]
//    }
//
//    return arrEquilibrium.isEmpty ? nil : arrEquilibrium
//
//}
//
//excTime = BenchTimer.measureBlock {
//    _ = equilibriumOptimized(array)
//}
//
//print(excTime)
//
//print(equilibriumOptimized(array))


//func isEqual<T: Equatable>(left: T, right: T) -> Bool {
//    return left == right
//}
//
//struct Car<T1: Comparable, T2: Comparable>: Equatable {
//    var car1: T1
//    var car2: T2
//
//    static func == (lhs: Car<T1, T2>, rhs: Car<T1, T2>) -> Bool {
//        return lhs.car1 == rhs.car1 && lhs.car2 == lhs.car2
//    }
//
//}
//
//
//print(isEqual(left: 10, right: 10))
//let carInt = Car(car1: 10.0, car2: 20)
//
//let car2 = Car(car1: 10.0, car2: 20)
//print(isEqual(left: carInt, right: car2))
//
//print(carInt.car1)
//print(carInt)

//extension Array {
//     func checkIndexSafe(index: Index) -> Element? {
//       return self.indices.contains(index) ? self[index] : nil
//    }
//}
//
//let number = [1,2,5,3,1,2]
//
//print(number.checkIndexSafe(index: 100))

//number.forEach { value in
//    if let index = number.firstIndex(of: value) {
//        print("index\(index)value\(value)")
//    }
//}

//print(number.indices.contains(10))
//if number.indices.contains(10) {
//    print(number[10])
//}

//var numbers: Set<Int> = [12,3,2,1,7]
//
//var numbers2: Set = [1,2,3,4]

//union append two set into one and remove duplicate
//example: numberSet1[1,2,3,4].union(numberset2[1,5,6]) =>> output[1,2,3,4,5,6]
//let union = numbers.union(numbers2)
//print(union)

//intersection get all same element in to a Set
//example: numberSet1[1,2,3,4].intersection(numberset2[1,5,6]) =>> output[1]
//let intersection = numbers.intersection(numbers2)
//print(intersection)

//Subtracting remove all same elements of two set
//example: numberSet1[1,2,3,4].intersection(numberset2[1,5,6]) =>> output[1]
//let subtracting = numbers.subtracting(numbers2)
//print(subtracting)

//SymmetricDifference return a Set with elements that are only in either set, but not both.
//example: numberSet1[1,2,3,4].SymmetricDifference(numberset2[1,5,6]) =>> output[2,3,4,5,6]
//let symmetricDiff = numbers.symmetricDifference(numbers2)
//print(symmetricDiff)


//Hashable

//struct SimpleStruct: Hashable {
//    var name: String
//    var number: Int
//
//    public var hasValue: Int {
//        return name.hashValue
//    }
//
//}
//
//var simple1 = SimpleStruct(name: "1234", number: 3)
//
//var simple2 = SimpleStruct(name: "1234", number: 4)
//print(simple1.name.hashValue)
//print(simple2.name.hashValue)
//
//var setSimples = Set<SimpleStruct>()
//setSimples.insert(simple1)
//setSimples.insert(simple2)
//let sortSet = setSimples.sorted { element1, element2 in
//    return element1.number > element2.number
//}
//print(sortSet[1])
//print(sortSet)


//DICT

//var dict:[AnyHashable: Any] = [1:"3","2":5,"4":10]
//dict["hhehe"] = 20
//dict.updateValue("popo", forKey: "hh")
//print(dict)
//for key in dict.values {
//    print(key)
//}

//let number: Array<Int> = [6,3,11,10,33,55]


//func selectionSort(array: [Int]) -> [Int] {
//    var coppyArr = array
//
//    for i in 0..<coppyArr.count - 1 {
//
//        var lowerIndex = i
//
//        for j in lowerIndex + 1..<coppyArr.count {
//            if coppyArr[j] < coppyArr[lowerIndex] {
//                lowerIndex = j
//            }
//        }
//
//        if i != lowerIndex {
//            coppyArr.swapAt(i, lowerIndex)
//        }
//
//    }
//
//    return coppyArr
//}
//
//print(selectionSort(array: number))

//let number: Array<Int> = [6,3,11,10,33,55]
//
//
//func insertSort(_ inPut: [Int]) -> [Int] {
//
//    var result = inPut
//
//    for sortIndex in 1..<result.count {
//
//        var backIndex = sortIndex
//
//        while backIndex > 0 && result[backIndex] < result[backIndex - 1] {
//            result.swapAt(backIndex - 1, backIndex)
//            backIndex -= 1
//        }
//
//    }
//
//    return result
//}
//
//print(insertSort(number))

//let number: Array<Int> = [6,3,11,1,2,10,33,55]

//func bubbleSort(_ input: [Int]) -> [Int] {
//
//    guard input.count > 1 else {return input}
//    var result = input
//
//    var isSwapped = false
//
//    repeat {
//        isSwapped = false
//        for index in 1..<result.count {
//            if result[index] < result[index - 1] {
//                result.swapAt(index - 1, index)
//                isSwapped = true
//            }
//        }
//    } while isSwapped
//
//                return result
//
//}

//print(bubbleSort(number))


//let number: Array<Int> = [6,3,11,1,2,10,33,55]
//
//
//func bubbleShort(array: [Int]) -> [Int] {
//    guard array.count > 1 else {
//        return array
//    }
//
//    var coppyArr = array
//
//    var isShorted = false
//
//    repeat {
//        isShorted = false
//        for index in 1..<coppyArr.count {
//            if (coppyArr[index] < coppyArr[index - 1]) {
//                coppyArr.swapAt(index, index - 1)
//                isShorted = true
//            }
//        }
//    } while isShorted
//
//    return coppyArr
//}
//
//print(bubbleShort(array: number))


//@propertyWrapper
//struct Base64Encoded {
//    private var value = ""
//
//    var wrappedValue : String {
//        get { Data(value.utf8).base64EncodedString() }
//        set { value = newValue }
//    }
//
//}
//
//struct ListName {
//   @Base64Encoded var name: String
//}
//
//var name = ListName()
//name.name = "My name is Dat"
//
//print(name.name)



//@propertyWrapper
//class NumberToString {
//    private var value = ""
//    var wrappedValue: String {
//        get { "My age is " + value}
//        set {value = newValue}
//    }
//}
//
//
//class ListPerson {
//    @NumberToString var age: String
//}
//
//
//var person = ListPerson()
//person.age = "18"
//print(person.age)

let number: Array<Int> = [6,3]


func quicksort(array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let pivotIndex = array.count / 2
    let pivot = array[pivotIndex]
    
    let less = array.filter{ $0 < pivot}
    let equal = array.filter{ $0 == pivot}
    let greather = array.filter{$0 > pivot}
    
    return quicksort(array: less) + equal + quicksort(array: greather)
}

print(quicksort(array: number))

