let s = "cabca"
let s1 = "ab"
let s2 = ""
let s3 = "fhgshghs"

func differentSymbolsNaive(_ s: String) -> Int {
    if s.count < 3 || s.count > 1000 {
        return 0
    }
    
    let stringSet = Set(s)
    
    return stringSet.count
}

let differentSymbols = differentSymbolsNaive(s3)

print(differentSymbols > 0 ? "\(differentSymbols) caracteres diferentes en la cadena." : "La cadena debe tener entre 3 y 100 caracteres.")
