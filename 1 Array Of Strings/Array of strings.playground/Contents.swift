let stringsArray = ["aba", "aa", "ad", "vcd", "aba"]
let stringsArray1 = ["123", "456", "abc", "def", "g"]
let stringsArray2 = ["1", "12", "123", "1234", "12345"]

let stringsArray3 = [String]()
let stringsArray4 = ["12345678901", "09876543210", "a", "bc", "def"]
let stringsArray5 = ["aba", "aa", "ad", "vcd", ""]
let stringsArray6 = ["aba", "aa", "ad", "vcd", "aba", "q", "w", "e", "r", "t", "y"]

func allLongestStrings(stringsArray: [String]) -> ([String], String?) {
    
    guard stringsArray.count >= 1 && stringsArray.count <= 10 else {
        return([], "El array debe contener entre 1 y 10 elementos.")
    }
    guard !stringsArray.contains(where: { $0.isEmpty || $0.count > 10 }) else {
        return([], "El array no debe contener elementos vacíos o de longitud mayor a 10.")
    }
    
    let maxLength = stringsArray.map { $0.count }.max()
    let longestStrings = stringsArray.filter { $0.count == maxLength }
    
    return (longestStrings, nil)
}

let (returnArray, returnError) = allLongestStrings(stringsArray: stringsArray)
print(returnError ?? "Resultado: \(returnArray)")
