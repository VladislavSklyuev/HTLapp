//
//  StringExt.swift
//  Hotel
//
//  Created by Владислав Склюев on 20.12.2023.
//

import Foundation

extension String {
    func formattedMask(_ text: String, mask: String?) -> String {
        let cleanPhoneNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
        var result = ""
        var index = cleanPhoneNumber.startIndex
        if let mask {
            for ch in mask where index < cleanPhoneNumber.endIndex {
                if ch == "X" {
                    result.append(cleanPhoneNumber[index])
                    index = cleanPhoneNumber.index(after: index)
                } else {
                    result.append(ch)
                }
            }
        }
        return result
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone
        var i = 3
        print(numbers)
        var result = "\(numbers)"
        
        guard let last = result.last else { return "+7(***)***-**-**" }
        
        guard last.isNumber else { return "+7(***)***-**-**" }
        var resArray = result.map { "\($0)" }
        print(resArray)
        guard i < resArray.endIndex - 1 else { return "+7(***)***-**-**" }
        
        print("i=\(i)")
        
        let valChar = resArray.removeLast()
        print("valChar = \(valChar)")
        if resArray[i] == "*" {
            print("char == *")
            
            resArray[i] = "\(valChar)"
            print("offset = \(i)")
            print("resArray[offset] = \(resArray[i])")
            print(resArray)
            i = resArray.index(after: i)
            
        } else {
            i = resArray.index(after: i)
            resArray[i] = "\(valChar)"
            i = resArray.index(after: i)
            print(resArray)
        }
        var myPhone = ""
        resArray.forEach { char in
            myPhone += char
        }
        result = myPhone
//        print(myPhone)
//        self.myPhone = myPhone
        return result
    }
}
