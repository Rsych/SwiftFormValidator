//
//  ValidationManager.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import Foundation

protocol ValidationManager {
    func validate(_ val: Any) -> ValidationError? 
}

// MARK: - Regex Validator

struct RegexValidationManagerImpl: ValidationManager {
    private let items: [RegexFormItem]
    
    init(_ items: [RegexFormItem]) {
        self.items = items
    }
    
    func validate(_ val: Any) -> ValidationError? {
        let val = (val as? String) ?? ""
        
        for regexItem in items {
            let regex = try? NSRegularExpression(pattern: regexItem.pattern)
            let range = NSRange(location: 0, length: val.count)
            if regex?.firstMatch(in: val, options: [], range: range) == nil {
                return regexItem.error
            }
        }
        return nil
    }
}

// MARK: - Date Validator

struct DateValidationManagerImpl: ValidationManager {
    private let ageLimit: Int = 18
    
    func validate(_ val: Any) -> ValidationError? {
        guard let date = val as? Date else {
            return ValidationError.custom(message: "Invalid Value passed")
        }
        
        if let calculatedYr = Calendar.current.dateComponents([.year], from: date, to: Date()).year,
           calculatedYr < ageLimit {
            return ValidationError.custom(message: "User is below the age of 18")
        }
        return nil
    }
}