//
//  ContentView.swift
//  SwiftFormValidator
//
//  Created by Ryan J. W. Kim on 2021/12/12.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @StateObject private var contentBuilder = FormContentBuilderImpl()
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 44))], spacing: 20) {
                ForEach(contentBuilder.content) { component in
                    switch component {
                    case is TextFormComponent:
                        TextFieldFormView(component: component as! TextFormComponent)
                            .environmentObject(contentBuilder)
                    case is DateFormComponent:
                        DateFormView(component: component as! DateFormComponent)
                            .environmentObject(contentBuilder)
                    case is ButtonFormComponent:
                        ButtonFormView(component: component as! ButtonFormComponent) { id in
                            switch id {
                            case .submit:
                                // Validate
                                break
                            default:
                                break
                            }
                        }
                    default:
                        EmptyView()
                    }
                }
            }  //: LazyV
            .padding(.top, 100)
        }  //: ScrollV
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
