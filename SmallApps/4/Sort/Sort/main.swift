//
//  main.swift
//  Sort
//
//  Created by Alexander Rubtsov on 23.06.2021.
//

import Foundation

func sort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else { return arr }
    
    let devider = arr.count/2
    
    let left = sort(Array(arr[0..<devider]))
    let right = sort(Array(arr[devider..<arr.count]))
    
    return merge(left: left, right: right)
}

func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    
    var sorterArray = [T]()
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement > rightElement {
            sorterArray.append(rightElement)
            rightIndex+=1
        } else if leftElement < rightElement {
            sorterArray.append(left[leftIndex])
            leftIndex+=1
        } else {
            sorterArray.append(rightElement)
            sorterArray.append(leftElement)
            leftIndex+=1
            rightIndex+=1
        }
    }
    
    while leftIndex < left.count {
        sorterArray.append(left[leftIndex])
        leftIndex+=1
    }
    
    while rightIndex < right.count {
        sorterArray.append(right[rightIndex])
        rightIndex+=1
    }
    
    return sorterArray
}

//MARK: - Test

var array = sort([1,6,8,2,5,9,3,7,10,4])

print(array)

