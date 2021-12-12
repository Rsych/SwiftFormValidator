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
    
    @State private var selectedDate = Date()
    @State private var error: ValidationError?
    
    @EnvironmentObject var contentBuilder: FormContentBuilderImpl
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker("", selection: $selectedDate, displayedComponents: [component.mode])
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(error?.errorDescription ?? "")
                .font(.footnote)
                .bold()
                .foregroundColor(.red)
        }  //: Vstack
        .onChange(of: selectedDate) { newValue in
            
            contentBuilder.update(selectedDate, in: component)
            
            error = component
                .validations
                .compactMap{ $0.validate(selectedDate) }
                .first
        }
    }
}

struct DateFormView_Previews: PreviewProvider {
    static var previews: some View {
        DateFormView(component: .init(id: .dob, mode: .date))
            .environmentObject(FormContentBuilderImpl())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
