//1.3 Design an algorithm and write code to remove the duplicate characters in a string without using any additional buffer NOTE: One or two additional variables are fine An extra copy of the array is not.//  Write the test cases for this method.

func removeDuplicates1(inout str: [Character]) {
    let strLen = str.count
    if strLen < 2 {
        return
    }
    var tail = 1
    for i in 1 ..< strLen {
        var j: Int
        for j = 0; j < tail; ++j {
            if str[i] == str[j] {
                break
            }
        }
        if j == tail {
            str[tail] = str[i]
            ++tail
        }
    }
    if tail < str.count {
        str[tail] = "\0"
    }

    for var x = 0; x < str.count; ++x {     // Remove characters after "\0"
        if str[x] == "\0" {
            let range = Range(start: x, end: str.count)
            str.removeRange(range)
            break
        }
    }
    
}

var testCase1_1 = Array("abcd")
var testCase1_2 = Array("AAaaaa")
var testCase1_3 = Array("")
var testCase1_4 = Array("aaabbbcc")
var testCase1_5 = Array("abcabcabc")

removeDuplicates1(&testCase1_1)
removeDuplicates1(&testCase1_2)
removeDuplicates1(&testCase1_3)
removeDuplicates1(&testCase1_4)
removeDuplicates1(&testCase1_5)

testCase1_1
testCase1_2
testCase1_3
testCase1_4
testCase1_5





//// confused
//
//func removeDuplicates2(inout str: [Character]) {
//    var tail = 1
//    for i in 1 ..< str.count {
//        var j = 0
//        for x in 0 ..< tail {
////1        for ; j < tail; j++ {
//            j = x
//            if str[i] == str[j] {
//            println("i = \(i);j = \(j)")
//                break
//            }
//            println("i = \(i);j = \(j)")
//        }
//        if j == tail {
//            str[tail] = str[i]
//            ++tail
//        }
//    }
//    if tail < str.count {
//        str[tail] = "\0"
//    }
//}
//
//var test1: [Character] = Array("aaabbbccc")
//removeDuplicates2(&test1)
//test1












