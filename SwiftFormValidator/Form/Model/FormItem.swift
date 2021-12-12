//
//  FormItem.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import UIKit
import SwiftUI

/**
 * Implementation for a form item
 */

protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
    var validations: [ValidationManager] { get }
    var val: Any? { get }
}

/**
 * Implementation for a form section
 */

protocol FormSectionItem {
    var id: UUID { get }
    var items: [FormComponent] { get }
    init(items: [FormComponent])
}

/**
 * Unique identifiers for form items
 */

enum FormField: String, CaseIterable {
    case firstName
    case lastName
    case email
    case dob
    case submit
}

/**
 * Component for a form items the form
 */

class FormComponent: FormItem, Identifiable {
      
    let id = UUID()
    let formId: FormField
    var validations: [ValidationManager]
    var val: Any?
    init(_ id: FormField, validations: [ValidationManager] = []) {
        self.formId = id
        self.validations = validations
    }
}

/**
 * Component for a text item in the form
 */

final class TextFormComponent: FormComponent {
   
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(id: FormField,
        placeholder: String,
         keyboardType: UIKeyboardType = .default, validations: [ValidationManager] = []) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        super.init(id, validations: validations)
    }
}

/**
 * Component for a date item in the form
 */

final class DateFormComponent: FormComponent {

    let mode: DatePickerComponents
    
    init(id: FormField,
         mode: DatePickerComponents, validations: [ValidationManager] = []) {
        self.mode = mode
        super.init(id, validations: validations)
    }
}

/**
 * Component for a button item in the form
 */

final class ButtonFormComponent: FormComponent {

    let title: String
    
    init(id: FormField,
         title: String) {
        self.title = title
        super.init(id)
    }
}
