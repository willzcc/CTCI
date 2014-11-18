// 1.1 Implement an algorithm to determine if a string has all unique characters What if you can not use additional data structures?

// assume char set is ASCII(256 chars)

func isUniqueChar1(str: String) -> Bool {
    var char_set = [Bool](count: 256, repeatedValue: false)
    for char in str.unicodeScalars {
        if char_set[Int(char.value)] == true {
            return false
        }
        char_set[Int(char.value)] = true
    }
    return true
}
isUniqueChar1("abcd")


// Macbook Air Core i5 64bit CPU ; OSX 10.10   Int equals to Int64
func isUniqueChar2(str: String) -> Bool {
    var array = [Int](count: 4, repeatedValue: 0) // 4 * 64bit = 256
    for char in str.unicodeScalars {
        var idx: Int = Int(char.value / 64)
        var shift = Int(char.value % 64)
        if (array[idx] & (1 << shift)) > 0 {
            return false
        }
        array[idx] |= (1 << shift)
    }
    return true
}

isUniqueChar2("abcd")
