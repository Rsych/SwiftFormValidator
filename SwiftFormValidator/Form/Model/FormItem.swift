//
//  FormItem.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import Foundation
import UIKit

struct FormItem: Identifiable {
    var id: UUID
    let firstName: String
    let lastName: String
    let email: String
    let dob: Date
    let submit: Bool
}

// MARK: - Base Form Component
class FormComponent {
    let id = UUID()
    let formID: FormItem
    var val: Any?
    init(_ id: FormItem) {
        self.formID = id
    }
}

// MARK: - Text Component

final class TextFormComponent: FormComponent {
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(id: FormItem, placeholder: String, keyboardType: UIKeyboardType = .default) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        super.init(id)
    }
}

// MARK: - Date Component

final class DateFormComponent: FormComponent {
    let mode: UIDatePicker.Mode
    
    init(id: FormItem, mode: UIDatePicker.Mode) {
        self.mode = mode
        super.init(id)
    }
}

// MARK: - Button Component

final class ButtonFormComponent: FormComponent {
    let title: String
    
    init(id: FormItem, title: String) {
        self.title = title
        super.init(id)
    }
}
