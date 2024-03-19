import Foundation

let a = [1, 2, 3]
var b = [2, 1, 3]

let c = [1, 2, 3]
var d = [2, 1, 3]

let e = [1, 2, 2]
var f = [2, 1, 1]

let g = [1, 2]
var h = [2, 1]

let i = [1, 2, 1001]
var j = [2, 1, 1001]

func areSimilar(a: [Int], b: [Int]) -> (Bool, String) {
    let _10pow5 = Int(pow(10.0, 5))
    var swipe = 0
    var c = b
    
    guard a.sorted() == b.sorted() else { return (false, "Los arrays no son similares.")  }
    
    guard a.count >= 3 && a.count <= _10pow5 else {
        return (false, "Los arrays deben tener la misma longitud, entre 3 y \(_10pow5) elementos.")
    }
    
    guard !a.contains(where: { $0 < 1 || $0 > 1000 }) && !b.contains(where: { $0 < 1 || $0 > 1000 }) else {
        return (false, "Los array debe contener elementos con valores entre 1 y 1000.")
    }

    guard a != b else { return (true, "Arrays similares.") }
    
    for i in 0 ..< a.count {
        if a[i] != b[i] {
            c[i] = a[i]
            swipe += 1
        }
        if swipe == 2 && a == c {
            return (true, "Arrays similares.")
        } else if swipe > 2  {
            return (false, "Los arrays no son simlares.")
        }
    }
    return (false, "Los arrays no son simlares.")
}

let (similars, message) = areSimilar(a: a, b: b)
print("\(similars). \(message)")
