//
//  FormContentBuilder.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import Foundation

protocol FormContentBuilder {
    var content: [FormComponent] { get }
}

final class FormContentBuilderImpl: ObservableObject, FormContentBuilder {
    
    private(set) var content: [FormComponent] = [
        TextFormComponent(id: .firstName, placeholder: "First Name"),
        TextFormComponent(id: .lastName, placeholder: "Last Name"),
        TextFormComponent(id: .email, placeholder: "Email", keyboardType: .emailAddress),
        DateFormComponent(id: .dob, mode: .date),
        ButtonFormComponent(id: .submit, title: "Confirm")
    ]
}
