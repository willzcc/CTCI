// Standard version

func partition(inout dataList: [Int], low: Int, high: Int) -> Int {
    var pivotPos = low
    var pivot = dataList[low]
    
    for var i = low + 1; i <= high; i++ {
        if dataList[i] < pivot && ++pivotPos != i {
            swap(&dataList[pivotPos], &dataList[i])
        }
    }
    swap(&dataList[low], &dataList[pivotPos])
    return pivotPos
}

func quickSort(inout dataList: [Int], left: Int, right: Int) {
    if left < right {
        var pivotPos = partition(&dataList, left, right)
        quickSort(&dataList, left, pivotPos - 1)
        quickSort(&dataList, pivotPos + 1, right)
    }
}

var dataList = [42, 12, 88, 62, 63, 56, 1, 77, 88, 97, 97, 20, 45, 91, 62, 2, 15, 31, 59, 5]
quickSort(&dataList, 0, dataList.count - 1)


// Generic version quickSort
func partition<T: Comparable>(inout dataList: [T], low: Int, high: Int) -> Int {
    var pivotPos = low
    var pivot = dataList[low]
    for var i = low + 1; i <= high; i++ {
        if dataList[i] < pivot && ++pivotPos != i {
            swap(&dataList[pivotPos], &dataList[i])
        }
    }
    swap(&dataList[low], &dataList[pivotPos])
    return pivotPos
}

func quickSort<T: Comparable>(inout dataList: [T], left: Int, right: Int) {
    if left < right {
        var pivotPos = partition(&dataList, left, right)
        quickSort(&dataList, left, pivotPos - 1)
        quickSort(&dataList, pivotPos + 1, right)
    }
}

struct Vector: Comparable {
    var x: Double = 0.0
    var y: Double = 0.0
}

func <(p: Vector, q: Vector) -> Bool {
    return p.x < q.x && p.y < q.y
}

func ==(p: Vector, q:Vector) -> Bool {
    return p.x == q.x && p.y == q.y
}

var numbers = [42, 12, 88, 62, 63, 56, 1, 77, 88, 97, 97, 20, 45, 91, 62, 2, 15, 31, 59, 5]
var strings = ["b", "c", "Z", "a", "A", " ", ">", "89", "1", "y", "Y", "&"]
var vectors = [Vector(x: 2.0, y: 2.0), Vector(x: 3.0, y: 3.0), Vector(x: 1.0, y: 1.0)]


quickSort(&numbers, 0, numbers.count - 1)
quickSort(&strings, 0, strings.count - 1)
quickSort(&vectors, 0, vectors.count - 1)














