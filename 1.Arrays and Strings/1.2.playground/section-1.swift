// 1.2 Write code to reverse a C-Style String. (C-String means that “abcd” is represented as five characters, including the null character.)

// there is no '\0' at the end of string in swift, we use 'N' instead '\0', just for simulating in reverse1
// Swift pass string by copy, we can not pass string by reference. We use a character array for simulating in reverse2

func reverse1(str: String) -> String {
    var end = 0
    var revStr = ""
    for char in str {
        ++end
    }
    --end
    for ; end > 0; end-- {
        revStr.append(Array(str)[end - 1])
    }
    revStr.append("N" as Character)
    return revStr
}

reverse1("abcd12345N")
reverse("abcd12345N")    // defualt swift reverse function


func reverse2(var str: [Character]) -> [Character] {
    if str.count < 2 {
        return str
    }
    var start = 0
    var end = str.count - 1 - 1
    for ; start < end; end-- {
//        var tmp = str[start]         // standard swap func
//        str[start] = str[end]
//        str[end] = tmp
        (str[start], str[end]) = (str[end], str[start])  // use tuple in swift for swapping
        start++
    }
    return str
}

reverse2(Array("abcde\0"))




// something for reference
var str = "abcd"
Array(str)[0]
str[advance(str.startIndex, 0)]
