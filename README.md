Cracking-the-Coding-Interview-4Th
=================================

Solutions for the book: Cracking the coding interview V4. Written in Swift with playground.


#开始面试-解算法问题的5大方法
#Five Algorithm Approaches
#算法无法？算法5法！

>There’s no sure fire approach to solving a tricky algorithm problem, but the approaches below can be useful Keep in mind that the more problems you practice, the easier it will to identify which approach to use
其实解决复杂的算法问题时并没有什么良方高招，但是下面的介绍的5种方法还是有一定的实用性。下面的方法你练习的越多，就越能鉴别出用什么方法来解决问题。
Also, remember that the five approaches can be “mixed and matched ” That is, once you’ve applied “Simplify & Generalize”, you may want to implement Pattern Matching next
这5种方法并不是彼此独立的，也可能会交叉起来使用。比如同一个问题可能会用到“简化和一般化”和“套用常见方法”两种方法。

APPROACH I: EXAMPLIFY
法1：举例法
Description: Write out specific examples of the problem, and see if you can figure out a general rule
说明：举出个普通的例子，看看是否能够发现其中的规则。
Example: Given a time, calculate the angle between the hour and minute hands 
Approach: Start with an example like 3:27 We can draw a picture of a clock by selecting where the 3 hour hand is and where the 27 minute hand is By playing around with these examples, we can develop a rule: 
? Minute angle (from 12 o’clock): 360 * minutes / 60 
? Hour angle (from 12 o’clock): 360 * (hour % 12) / 12 + 360 * (minutes / 60) * (1 / 12) 
? Angle between hour and minute: (hour angle - minute angle) % 360 
By simple arithmetic, this reduces to 30 * hours - 5 5 * minutes
例：给出任意一个时间点，计算出时针和分针之间的夹角
解法:首先从3:27这个例子出发。通过画示意图，观察时针和分针的角度，我们会发现下面的规律：
*以12：00位置为起始点，那么分针的角度则是 360*minute/60 
*以12：00位置为起始点，那么时针的角度则是 360*(hour%12)/12 + 360*(minutes/60)*(1/12)
*那两个指针之间的夹角是 (hour angle - minute angle)%360 
化简上述式子就得到最后的公式: 30 * hours - 55 * minutes

APPROACH II: PATTERN MATCHING
法2：套用常见方法
Description: Consider what problems the algorithm is similar to, and figure out if you can modify the solution to develop an algorithm for this problem
说明：如果出现的这个问题和之前用某个算法结果过的问题比较类似，就可以尝试改进原算法解决这个新问题。
Example: A sorted array has been rotated so that the elements might appear in the order 3 4 5 6 7 1 2 How would you find the minimum element? Similar Problems: ? Find the minimum element in an array ? Find a particular element in an array (eg, binary search)
例：一个经过排序的数组再做一次循环移动，那么数组中的数字可能是这样的 3 4 5 6 7 1 2。那你如何找到数组中最小值呢？
相似的问题:
* 在数组中查找最小值
* 在数组中查找查找一个特殊的值(例如：二分查找)
Algorithm: Finding the minimum element in an array isn’t a particularly interesting algorithm (you couldjust iterate through all the elements), nor does it use the information provided (that the arrayis sorted) It’s unlikely to be useful here 
However, binary search is very applicable You know that the array is sorted, but rotated So,it must proceed in an increasing order, then reset and increase again The minimum elementis the “reset” point 
If you compare the first and middle element (3 and 6), you know that the range is still increas-ing This means that the reset point must be after the 6 (or, 3 is the minimum element and the array was never rotated) We can continue to apply the lessons from binary search topinpoint this reset point, by looking for ranges where LEFT > RIGHT That is, for a particularpoint, if LEFT < RIGHT, then the range does not contain the reset If LEFT > RIGHT, then it does
算法：查找最值并不是什么特别东西（你可以遍历数组然后找到最小值,即使提供了一些额外的信息,比如:数组已近排序)。刚才问题上额外信息似乎没有什么用。但是二分查找好像比较有用，因为给出的条件说数组已经排序过了。可是还做了一次循环移动。那么这个数组的模式应该这样的：先是升序，突然重置，接着继续升序。那么这个重置点就是最小值。
比较第一个这个中间的元素(3和6)，这个是升序的。那么这说明了这个重置点在6之后的那一段(或者3就是最小是，因为数组没有循环移动过)。那么我可以继续采用这样方法进行二分查找。如果左边小于右边，说明重置点不在这个范围内；如果左边大于右边则重置点在这个范围内，继续进行二分查找。

APPROACH III: SIMPLIFY & GENERALIZE
法3：简化&一般化
Description: Change a constraint (data type, size, etc) to simplify the problem Then try to solve it Once you have an algorithm for the “simplified” problem, generalize the problem again
说明：通过改变一些条件，（比如数据类型或者问题的规模）来简化问题，然后设计一个算法来解决这个简化过的问题，然后在问题一般化还原回来。
Example: A ransom note can be formed by cutting words out of a magazine to form a newsentence How would you figure out if a ransom note (string) can be formed from a given magazine (string)?
例：一份敲诈信可以用从杂志上剪下来的单词拼凑出来。给出一份敲诈信(字符串)，你问是否能从给定的杂志中拼出来敲诈信。
Simplification: Instead of solving the problem with words, solve it with characters That is,imagine we are cutting characters out of a magazine to form a ransom note
简化：将问题简化成给定一份字符，问是否能够拼成一个单词。
Algorithm: We can solve the simplified ransom note problem with characters by simply creating an array and counting the characters Each spot in the array corresponds to one letter First, we countthe number of times each character in the ransom note appears, and then we go through the magazine to see if we have all of those characters
算法：对于这个简化的问题，我可以先创建一个数组用来给统计字符出现的次数。首先我们计算每个字母在敲诈信中出现的个数，然后在给出的字符串集合中是否有这么多的字母。
When we generalize the algorithm, we do a very similar thing This time, rather than creating an array with character counts, we create a hash table Each word maps to the number of times the word appears
再”一般化“-还原这个问题，我们可以采用非常类似的方法。这次我们采用的创建一个哈希表来映射每个单词映出现的次数。

APPROACH IV: BASE CASE AND BUILD
法4：简单构造法
Description: Solve the algorithm first for a base case (e g , just one element) Then, try tosolve it for elements one and two, assuming that you have the answer for element one Then,try to solve it for elements one, two and three, assuming that you have the answer to ele-ments one and two
说明：从最基本的情况来解决问题(比如只有一个元素)，然后再推导出有两个元素的情况，再利用一个元素和两个元素的结论推导出三个元素的情况。
Example: Design an algorithm to print all permutations of a string For simplicity, assume all characters are unique
Test String: abcdefg
Case “a” --> {a} 
Case “ab” --> {ab, ba}
Case “abc” --> ?
例：设计算法打印出一串字符的全排列。假设所有的字符都不同。
测试字符串：abcdefg
“a”       全排列为 {a}
“ab”    全排列为 {ab,ba}
“abc” 全排列为  ?
This is the first “interesting” case If we had the answer to P(“ab”), how could we generateP(“abc”) Well, the additional letter is “c”, so we can just stick c in at every possible point That is:
merge(c, ab) --> cab, acb, abc 
merge(c, ba) --> cba, bca, bac
通过上面例子我们不能发现，如果我们知道P("ab"),我们就能生成P(“abc”)。我只需要将新加入的字母"c"插入到每个可以插入位置即可。如下：
merge(c, ab) --> cab, acb, abc 
merge(c, ba) --> cba, bca, bac
Algorithm: Use a recursive algorithm Generate all permutations of a string by “chopping off”the last character and generating all permutations of s[1… n-1] Then, insert s[n] into everylocation of the string
算法：递归。先截去字符串中的最后一个字母，生成所有s[1…n-1]的全排列，然后再将最后一个字母插入到每一个可插入的位置。
NOTE: Base Case and Build Algorithms often lead to natural recursive algorithms
注意：一般采用这样的构造法大多都会用到递归。

APPROACH V: DATA STRUCTURE BRAINSTORM
法5：数据结构头脑风暴
Description: This is hacky, but it often works Simply run through a list of data structures and try to apply each one
说明：方法看起来有点笨，但是很实用。过一遍数据结构然后看看哪个最适合解这个问题。
Example: Numbers are randomly generated and stored into an (expanding) array How would you keep track of the median? 
Data Structure Brainstorm: 
? Linked list? Probably not – linked lists tend not to do very well with accessing and sorting numbers 
? Array? Maybe, but you already have an array Could you somehow keep the elements sorted? That’s probably expensive Let’s hold off on this and return to it if it’s needed  
? Binary tree? This is possible, since binary trees do fairly well with ordering In fact, if the binary search tree is perfectly balanced, the top might be the median But, be careful – if there’s an even number of elements, the median is actually the average of the middle two elements The middle two elements can’t both be at the top This is probably a workable algorithm, but let’s come back to it ? Heap? A heap is really good at basic ordering and keeping track of max and mins This is actually interesting – if you had two heaps, you could keep track of the biggest half and the smallest half of the elements The biggest half is kept in a min heap, such that the smallest element in the biggest half is at the root The smallest half is kept in a max heap, such that the biggest element of the smallest half is at the root Now, with these data structures, you have the potential median elements at the roots If the heaps are no longer the same size, you can quickly “rebalance” the heaps by popping an element off the one heap and pushing it onto the other
例：随机生成的数字，一个一个存到可扩展的数组中，如何跟踪数组的中位数。
数据结构头脑风暴：
* 链表：不太行。因为链表在随机访问和排序上性能不好。
* 数组：可能。但是你已经有一个数组了。还要一直保持数组中的数字有序，开销会比较大了。我们暂时先不选它，但可以作为备选项。
* 二叉树：有可能，因为二叉树在排序方面有很好的表现。如果二叉树是平衡的话，那么根节点就是中位数。但是注意，如果数组中有偶数个元素时，中位数应该是中间两个数的平均值。而根节点不可能是两个数的。结论：可能可行，待定。
* 堆：堆确在排序、查找最大值/最小值有很好的性能。如果你创建两个堆,一个是最大堆，一个最小堆。一个堆堆顶记录数组较小一半的最大值，另外一个堆顶记录较大值的最小值。这样的结构下，两个堆如果“平衡”的话，那堆顶的数字就可能是需要的中位数了。如果两个堆”不平衡(堆的大小不一样)，可以从元素多的堆中弹出堆顶的元素到另外一个堆，保持平衡。
Note that the more problems you do, the better instinct you will develop about which datastructure to apply
只要你平时练习的越多，那么对数据结构的选择就越有感觉。
