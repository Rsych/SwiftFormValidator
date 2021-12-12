//
//  ButtonFormView.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import SwiftUI

struct ButtonFormView: View {
    // MARK: - Properties
    let component: ButtonFormComponent
    let handler: ButtonActionhandler
    
    typealias ButtonActionhandler = (_ formID: FormField) -> Void

  init(component: ButtonFormComponent, handler: @escaping ButtonFormView.ButtonActionhandler) {
        self.component = component
        self.handler = handler
    }

    // MARK: - Body
    var body: some View {
        Button {
            handler(component.formId)
        } label: {
            Text(component.title)
        }
        .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
        .background(.blue)
        .foregroundColor(.white)
        .font(.headline)
        .cornerRadius(8)
    }
}

struct ButtonFormView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFormView(component: .init(id: .submit, title: "Title")) { _ in }
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
