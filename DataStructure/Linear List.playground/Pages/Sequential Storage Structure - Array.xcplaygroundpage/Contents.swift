//: [Previous](@previous)

import Foundation

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
public struct List<Element: Equatable> {
    private let maxSize = 20
    private var dataArray = [Element]()
    public var lenght: Int { // 此处后期修改改为手动计数
        return dataArray.count
    }
    
    // Methods
    // 初始化构造器
    init() {
        // reserveCapacity告诉swift这个数组至少需要的容量, 避免在数组添加元素过程中重复的申请内存
        dataArray.reserveCapacity(maxSize)
    }
    
    // 判断是否为空
    public func isEmpty() -> Bool {
        return lenght > 0 ? false : true
    }
    
    // 插入和添加
    public mutating func insert(of element: Element, at insertIndex: Int) {
        guard lenght < maxSize else {
            print("线性表已满!")
            return
        }
        
        guard insertIndex >= 0 && insertIndex <= lenght else {
            print("插入位置不在线性表范围内!")
            return
        }
        //#TODO: 插入逻辑未完成
        // 在Swift中插入位置之后的元素移位受到最后一位元素之后的位置未分配内存空间的限制
        
        dataArray.insert(element, at: insertIndex)
    }
    
    
    // 清除所有元素
    public mutating func removeAll() {
        dataArray.removeAll()
    }

    // 根据位置获取元素
    public func getElement(at index: Int) -> Element? {
        guard index >= 0 && index < lenght else {
            return nil
        }
        return dataArray[index]
    }
    
    // 获取元素位置
    public func locateElem(of elem: Element) -> Int? {
        for (index, value) in dataArray.enumerated() {
            if elem == value {
                return index
            }
        }
        return nil
    }
    
    // 根据位置删除元素
    public mutating func delete(at index: Int) {
        guard index >= 0 && index < lenght else {
            return
        }
        dataArray.remove(at: index)
    }
    
    // 打印dataArray
    public func printAll() {
        guard !self.isEmpty() else {
            print("空线性表!")
            return
        }
        print(dataArray)
    }
    
}


var list = List<Int>()
// 检查线性表是否为空
if list.isEmpty() {
    print("空线性表!")
}

// 获取线性表长度
print(list.lenght)

// 插入值
list.insert(of: 3, at: 4)
list.printAll()
list.insert(of: 1, at: 0)
list.insert(of: 2, at: 1)
list.printAll()

//// 插入值
list.insert(of: 4, at: 1)
list.printAll()

list.insert(of: 5, at: 3)
list.printAll()

// 获取元素
if let number = list.getElement(at: 1) {
    print(number)
}

// 获取元素位置
let numberIndex = list.locateElem(of: 5)

// 根据位置删除元素
list.delete(at: 1)
list.printAll()

// 清除
list.removeAll()
list.printAll()


