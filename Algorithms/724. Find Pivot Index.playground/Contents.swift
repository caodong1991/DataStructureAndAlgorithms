import Cocoa

// 前缀和
// 时间复杂度O(n)
// 空间复杂度O()
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        /*
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
        }
        */
        
        let sum = nums.reduce(0, +) // 求和
        var leftSum = 0
        
        for i in 0..<nums.count {
//            if leftSum == sum - leftSum - nums[i] {
//                return i
//            }
            // 上面条件可进一步进化为
            if 2 * leftSum == sum - nums[i] {
                return i
            }
            leftSum += nums[i]
        }
        return -1
    }
}

// test
var solution = Solution()
print(solution.pivotIndex([1, 7, 3, 6, 5, 6]))
print(solution.pivotIndex([1, 2, 3]))
print(solution.pivotIndex([-1, -1, 0, 1, 1, 0] ))


