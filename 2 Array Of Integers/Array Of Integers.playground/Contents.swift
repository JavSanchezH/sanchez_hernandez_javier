import Foundation

let inputArray = [1,2,1]
let inputArray1 = [1000,1,1000,0,1000,3]

let inputArray2 = [1,2,1000000001]
let inputArray3 = [-1,2,3]
var inputArray4 = (1...Int(pow(10.0, 4)) + 1).map { $0 }
var inputArray5 = Array(1...Int(pow(10.0, 4)) + 1)

func arrayReplace(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> ([Int], String?) {
    let _10pow9 = Int(pow(10.0, 9))
    let _10pow4 = Int(pow(10.0, 4))

    guard !(substitutionElem < 0 || substitutionElem > _10pow9) else {
        return ([], "El valor para sustituir debe ser entre 0 y \(_10pow9).")
    }
    guard inputArray.count <= _10pow4 else {
        return ([], "El array no debe contener más de \(_10pow4) elementos.")
    }
    guard !inputArray.contains(where: { $0 < 0 || $0 > _10pow9 }) else {
        return ([], "El array debe contener elementos con valores entre 0 y \(_10pow9).")
    }
    
    return (inputArray.map { $0 == elemToReplace ? substitutionElem : $0 }, nil)
}

let (returnArray, returnError) = arrayReplace(inputArray: inputArray, elemToReplace: 1, substitutionElem: 3)
print(returnError ?? "Resultado: \(returnArray)")
