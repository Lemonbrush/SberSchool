//
//  main.swift
//  String_function
//
//  Created by Alexander Rubtsov on 25.06.2021.
// func that checks palindrom

import Foundation

func isPalindrome(_ str: String) -> Bool {
    return str == String(str.reversed())
}

print(isPalindrome("hello"))
