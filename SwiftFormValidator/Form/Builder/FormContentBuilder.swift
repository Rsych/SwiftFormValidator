//
//  FormContentBuilder.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import Foundation

protocol FormContentBuilder {
    var content: [FormComponent] { get }
    func update(_ val: Any, in component: FormComponent)
}

final class FormContentBuilderImpl: ObservableObject, FormContentBuilder {
    // easily expand later by adding components
    private(set) var content: [FormComponent] = [
        TextFormComponent(id: .firstName, placeholder: "First Name",
                         validations: [
                            RegexValidationManagerImpl(
                                [
                                    RegexFormItem(pattern: RegexPatterns.name,
                                               error: .custom(message: "Invalid First name entered")
                                              )
                                ]
                            )
                         ]),
        TextFormComponent(id: .lastName, placeholder: "Last Name",
                         validations: [
                         RegexValidationManagerImpl(
                            [
                                RegexFormItem(pattern: RegexPatterns.name,
                                           error: .custom(message: "Invalid Last name entered")
                                          )
                            ]
                         )
                         ]),
        TextFormComponent(id: .email, placeholder: "Email", keyboardType: .emailAddress,
                          validations: [
                            RegexValidationManagerImpl(
                                [
                                    RegexFormItem(pattern: RegexPatterns.emailChars, error: .custom(message: "Invalid Email missing @")),
                                    RegexFormItem(pattern: RegexPatterns.higherThanSixChars, error: .custom(message: "less than 6 characters"))
                                ])]),
        DateFormComponent(id: .dob, mode: .date,
                          validations: [
                            DateValidationManagerImpl()
                          ]),
        ButtonFormComponent(id: .submit, title: "Confirm")
    ]
    func update(_ val: Any, in component: FormComponent) {
        guard let index = content.firstIndex(where: { $0.id == component.id}) else { return }
        content[index].val = val
    }
}
