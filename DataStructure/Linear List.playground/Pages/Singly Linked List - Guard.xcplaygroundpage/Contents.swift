//: [Previous](@previous)

import Foundation

// 链式存储结构
// 单链表

enum Direction {
    case head
    case tail
}

struct List<Element: Equatable> {
    private class Node {
        var value: Element?
        var next: Node?
        
        public init() {}
        
        public init(_ value: Element?) {
            self.value = value
        }
    }
    
    // 哨兵头节点
    private var guardHead: Node
    
    // 链表长度
    var length: Int { // O(n)
        var loop = 0
        var node = guardHead.next
        while node != nil {
            node = node!.next
            loop += 1
        }
        return loop
    }
    
    
    // 初始化构造器
    init() {
        guardHead = Node()
    }
    
    // 判断是否为空
    func isEmpty() -> Bool {
        return guardHead.next == nil
    }
    
    // 添加元素
    func append(_ value: Element, to direction: Direction = .head) {
        let newNode = Node(value)
        if direction == .head { // 头插法
            if let firstNode = guardHead.next {
                newNode.next = firstNode
            }
            guardHead.next = newNode
        } else { // 尾插法
            guard var node = guardHead.next else {
                guardHead.next = newNode
                return
            }
            while let next = node.next {
                node = next
            }
            node.next = newNode
        }
        
    }
    
    // 根据元素返回位置
    func getIndex(of value: Element) -> Int? {
        var node = guardHead.next
        var loop = 1
        while node != nil {
            if node!.value == value {
                return loop
            }
            node = node?.next
            loop += 1
        }
        return nil
    }
    
    // 根据位置获取元素
    // 约定：链表index从1开始
    func getValue(at index: Int) -> Element? {
        guard index > 0 && index <= self.length else {
            print("index 超出链表范围")
            return nil
        }
        var node = guardHead.next
        var loop = 1
        while loop < index {
            node = node?.next
            loop += 1
        }
        return node?.value
    }
    
    
    
    // 插入元素
    func insert(_ value: Element, at index: Int) {
        guard index > 0 && index <= self.length else {
            print("index 超出链表范围")
            return
        }
        
        var node: Node? = guardHead
        var loop = 1
        while loop < index {
            node = node?.next
            loop += 1
        }
        let newNode = Node(value)
        newNode.next = node?.next
        node?.next = newNode
    }

    // 删除元素
    func remove(at index: Int) -> Element? {
        guard index > 0 && index <= self.length else {
            print("index 超出链表范围")
            return nil
        }
        
        var node: Node? = guardHead
        var loop = 1
        while loop < index {
            node = node?.next
            loop += 1
        }
        var deleteNode = node?.next
        node?.next = deleteNode?.next
        let deleteValue = deleteNode?.value
        deleteNode = nil
        return deleteValue
    }

    // 删除所有元素
    func removeAll() {
        while guardHead.next != nil {
            var node = guardHead.next
            guardHead.next = node?.next
            node = nil
        }
    }
    
    
    // 打印
    func printAll() {
        guard !self.isEmpty() else {
            print("空单链表！")
            return
        }
        
        var listString: String = ""
        var node = guardHead.next
        while node != nil {
            listString += "\(String(describing: node!.value!))"
            node = node!.next
            if node != nil {
                listString += "->"
            }
        }
        print(listString)
    }
}


// test
var list = List<Int>()
list.printAll()

// 添加元素
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5, to: .tail)
list.append(6, to: .tail)

list.printAll()
print(list.length)
if let value = list.getValue(at: 8) {
    print(value)
}
if let value = list.getValue(at: 0) {
    print(value)
}
if let value = list.getValue(at: 7) {
    print(value)
}
if let value = list.getValue(at: 6) {
    print(value)
}
if let value = list.getValue(at: 3) {
    print(value)
}
if let value = list.getValue(at: 1) {
    print(value)
}

list.insert(7, at: -1)
list.insert(7, at: 0)
list.insert(7, at: 8)
list.insert(7, at: 7)
list.insert(7, at: 6)
list.printAll()
list.insert(8, at: 3)
list.printAll()
list.insert(9, at: 1)
list.printAll()

if let value = list.remove(at: -1) {
    print(value)
}
if let value = list.remove(at: 0) {
    print(value)
}
if let value = list.remove(at: 10) {
    print(value)
}
if let value = list.remove(at: 1) {
    print(value)
}
list.printAll()
if let value = list.remove(at: 5) {
    print(value)
}
list.printAll()
if let value = list.remove(at: 6) {
    print(value)
}
list.printAll()

if let index = list.getIndex(of: 10) {
    print(index)
} else {
    print("没有找到！")
}
if let index = list.getIndex(of: 4) {
    print(index)
} else {
    print("没有找到！")
}
if let index = list.getIndex(of: 6) {
    print(index)
} else {
    print("没有找到！")
}
if let index = list.getIndex(of: 8) {
    print(index)
} else {
    print("没有找到！")
}
if let index = list.getIndex(of: 2) {
    print(index)
} else {
    print("没有找到！")
}

list.removeAll()
list.printAll()



