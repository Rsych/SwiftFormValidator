//
//  ValidationError.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import Foundation

enum ValidationError: Error {
    case custom(message: String)
}

extension ValidationError {
    var errorDescription: String {
        switch self {
        case .custom(let message):
            return message
        }
    }
}
