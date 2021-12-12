//
//  ButtonFormView.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import SwiftUI

struct ButtonFormView: View {
    let component: ButtonFormComponent
    
    var body: some View {
        Button {
            
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
        ButtonFormView(component: .init(id: .submit, title: "Title"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
