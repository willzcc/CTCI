// 1.2 Write code to reverse a C-Style String. (C-String means that “abcd” is represented as five characters, including the null character.)

// there is no Null at the end of string in swift, we use 'N' instead, just simulate
// Swift pass string by copy, we can not pass string by reference.

func reverse(str: String) -> String {
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

reverse("abcd12345N")




// something for reference
var str = "abcd"
Array(str)[0]
str[advance(str.startIndex, 0)]
