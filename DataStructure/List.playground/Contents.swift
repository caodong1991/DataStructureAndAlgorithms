import UIKit

// 线性表
// 顺序存储结构
/*
 例子：Array
 优点：
 无需为表示表中元素之间的逻辑关系而增加额外的存储空间
 可以快速地存取表中任一位置
 
 缺点：
 插入和删除操作需要移动大量元素
 当线性表长度变化较大时，难以确定存储空间的容量
 造成存储空间的碎片
 */
public struct SequenceList<T: Equatable> {
    private let maxSize = 20
    private var dataArray = [T]()
    public var lenght: Int {
        return dataArray.count
    }
    
    // Methods
    // 初始化构造器
    init() {
        dataArray.reserveCapacity(maxSize)
    }
    
    // 判断是否为空
    public func isEmpty() -> Bool {
        if lenght > 0 {
            return false
        } else {
            return true
        }
    }
    
    // 插入
    public mutating func insert(of elem: T, at insertIndex: Int) {
        guard lenght <= maxSize && insertIndex > 0 && insertIndex <= lenght + 1 else {
            print("can not insert")
            return
        }
        dataArray.insert(elem, at: insertIndex - 1)
    }
    
    // 添加
    public mutating func append(_ elem: T) {
        guard lenght <= maxSize else {
            return
        }
        dataArray.append(elem)
    }
    
    // 清除
    public mutating func clear() {
        dataArray.removeAll()
    }

    // 根据位置获取元素
    public func getElem(at index: Int) -> T? {
        guard index > 0 && index <= lenght else {
            return nil
        }
        return dataArray[index - 1]
    }
    
    // 获取元素位置
    public func locateElem(of elem: T) -> Int? {
        var locateIndex: Int? = nil
        for (index, value) in dataArray.enumerated() {
            if elem == value {
                locateIndex = index + 1
                break
            }
        }
        return locateIndex
    }
    
    // 根据位置删除元素
    public mutating func delete(at index: Int) {
        guard index > 0 && index <= lenght else {
            return
        }
        dataArray.remove(at: index - 1)
    }
    
    // 打印dataArray
    public func printList() {
        guard !self.isEmpty() else {
            print("List is empty")
            return
        }
        print(dataArray)
    }
    
}

/*
var sequenceList = SequenceList<Int>()
// 检查是否为空
if sequenceList.isEmpty() {
    print("List is empty")
}

// 插入值
sequenceList.insert(of: 3, at: 4)
sequenceList.printList()

// 添加值
sequenceList.append(3)
sequenceList.printList()

// 插入值
sequenceList.insert(of: 4, at: 1)
sequenceList.printList()

sequenceList.insert(of: 5, at: 3)
sequenceList.printList()

// 获取元素
let number = sequenceList.getElem(at: 1)

// 获取元素位置
let numberIndex = sequenceList.locateElem(of: 5)

// 根据位置删除元素
sequenceList.delete(at: 1)
sequenceList.printList()

// 清除
sequenceList.clear()
sequenceList.printList()
*/

// 链式存储结构
// 单链表
public class SingleListNode<T> {
    var value: T?
    var next: SingleListNode?
    public init() {}
    public init(_ value: T) {
        self.value = value
    }
}

public class SingleList<T> {
    private var head: SingleListNode<T>
    public var length: Int { // O(n)
        guard var node = head.next else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public var firstValue: T? { // O(1)
        return head.next?.value
    }
    
    public var lastValue: T? {
        guard var node = head.next else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node.value
    }
    
    private var firstNode: SingleListNode<T>? { // O(1)
        return head.next
    }
    
    private var lastNode: SingleListNode<T>? {
        guard var node = head.next else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    // 初始化构造器
    public init() {
        head = SingleListNode<T>()
    }
    
    // 判断是否为空
    public func isEmpty() -> Bool {
        return head.next == nil
    }
    
    // 添加元素
    public func append(_ value: T) {
        let newNode = SingleListNode(value)
        // 尾插法
        if let lastNode = lastNode {
            lastNode.next = newNode
        } else {
            head.next = newNode
        }
        
        // 头插法
        /*
        if let firstNode = firstNode {
            newNode.next = firstNode
        }
        head.next = newNode
        */
    }
    
    // 根据位置获取元素
    public func getElem(at index: Int) -> T? {
        var node = head.next
        var loop = 1
        while loop < index {
            node = node?.next
            loop += 1
        }
        guard node != nil else {
            return nil
        }
        return node?.value
    }
    
    // 插入元素
    public func insert(_ value: T, at index: Int) {
        var node: SingleListNode<T>? = head
        var loop = 1
        while loop < (index - 1) {
            node = node?.next
            loop += 1
        }
        guard node != nil else {
            return
        }
        let newNode = SingleListNode(value)
        newNode.next = node?.next
        node?.next = newNode
    }
    
    // 删除元素
    public func remove(at index: Int) -> T? {
        var node: SingleListNode<T>? = head.next
        var previousNode: SingleListNode<T>? = head
        var loop = 1
        while loop < index {
            node = node?.next
            previousNode = node
            loop += 1
        }
        guard node != nil else {
            return nil
        }
        previousNode?.next = node?.next
        return node?.value
    }
    
    // 删除所有元素
    public func removeAll() {
        var node = head.next
        var deleteNode: SingleListNode<T>? = nil
        while node != nil {
            deleteNode = node?.next
            node = nil
            node = deleteNode
        }
        head.next = nil
    }
    
    // 打印
    public func printfList() {
        var listString: String = ""
        var node = head.next
        while node != nil {
            listString += "\(String(describing: node!.value!))"
            node = node!.next
            if node != nil {
                listString += "->"
            }
        }
        if listString.isEmpty {
            print("List is empty")
        } else {
            print(listString)
        }
    }
}



let singleList = SingleList<String>()
singleList.isEmpty()
singleList.firstValue
singleList.lastValue
singleList.getElem(at: 2)
singleList.getElem(at: 1)


singleList.append("hello")
singleList.isEmpty()
singleList.firstValue
singleList.lastValue
singleList.printfList()

singleList.append("world")
singleList.isEmpty()
singleList.firstValue
singleList.lastValue
singleList.printfList()

singleList.length
singleList.getElem(at: 2)
singleList.insert("Swft", at: 1)
singleList.printfList()

singleList.insert("Other", at: 10)
singleList.printfList()

singleList.remove(at: 1)
singleList.printfList()

singleList.remove(at: 5)
singleList.printfList()

singleList.removeAll()
singleList.printfList()
//if var firstValue: String? =  {
//    print("no value")
//} else {
//    print("first is \(firstValue)")
//}
//
//if var lastValue =  {
//    print("no value")
//} else {
//    print("last is \(lastValue)")
//}



