//
//  TextFieldFormView.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import SwiftUI

struct TextFieldFormView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            
            TextField("Placeholder here", text: .constant(""))
                .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
                .padding(.leading, 5)
                .keyboardType(.default)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.25))
                )  //: TextField 1
            
            Text("Error here")
                .font(.footnote)
                .bold()
                .foregroundColor(.red)
        }  //: VStack
    }
}

struct TextFieldFormView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldFormView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
