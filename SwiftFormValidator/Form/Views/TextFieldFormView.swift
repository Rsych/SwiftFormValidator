//
//  TextFieldFormView.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import SwiftUI

struct TextFieldFormView: View {
    // MARK: - Properties
    let component: TextFormComponent
    
    @State private var text = ""
    @State private var error: ValidationError?
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            
            TextField(component.placeholder, text: $text)
                .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                .padding(.leading, 5)
                .keyboardType(component.keyboardType)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(error == nil ? Color.gray.opacity(0.25): Color.red)
                )  //: TextField 1
            
            Text(error?.errorDescription ?? "")
                .font(.footnote)
                .bold()
                .foregroundColor(.red)
        }  //: VStack
        .onChange(of: text) { newValue in
            // Perform val
            error = component
                .validations
                .compactMap { $0.validate(text)}
                .first
        }
    }
}

struct TextFieldFormView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldFormView(component: .init(id: .firstName, placeholder: "Text here"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
