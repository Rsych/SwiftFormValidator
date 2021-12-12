//
//  DateFormView.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import SwiftUI

struct DateFormView: View {
    // MARK: - Properties
    let component: DateFormComponent
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker("", selection: .constant(Date()), displayedComponents: [component.mode])
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Error here")
                .font(.footnote)
                .bold()
                .foregroundColor(.red)
        }  //: Vstack
    }
}

struct DateFormView_Previews: PreviewProvider {
    static var previews: some View {
        DateFormView(component: .init(id: .dob, mode: .date))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
