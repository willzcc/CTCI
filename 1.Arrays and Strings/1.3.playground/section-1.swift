//1.3 Design an algorithm and write code to remove the duplicate characters in a string without using any additional buffer NOTE: One or two additional variables are fine An extra copy of the array is not//  Write the test cases for this method

func removeDuplicates(var str: [Character]) -> [Character] {
    let strLen = str.count
    if strLen < 2 {
        return str
    }
    var tail = 1
    for i in 1..<str.count {
        println(i)
        var j: Int
        for j = 0; j < tail; ++j {
            println("j\(j)")
            if str[i] == str[j] {
                str[i] = "0"
                break
            }
        }
        if j == tail {
            str[tail] = str[i]
            ++tail
        }
    }
//    for var x = 0; x < str.count; ++x {
//        if str[x] == "\0" {
//            let range = Range(start: x, end: str.count)
//            str.removeRange(range)
//        }
//    }
//    str[tail] = "0"
    return str
}

removeDuplicates(Array("aaabbbccc"))


