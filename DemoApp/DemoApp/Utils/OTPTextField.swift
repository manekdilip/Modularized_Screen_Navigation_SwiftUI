//
//  OTPTextField.swift
//  DemoApp
//
//

import Foundation
import SwiftUI

struct OTPTextField: View {
    
    let numberOfFields:Int
    @Binding var enterValue:[String]
    @FocusState private var fieldFocus:Int?
    @State private var oldValue = ""
    
    init(numberOfFields:Int,enterValue:Binding<[String]>) {
        self.numberOfFields = numberOfFields
        _enterValue = enterValue
    }
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfFields,id: \.self) { index in
                TextField("",text: $enterValue[index],onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                    .font(.largeTitle).bold()
                    .frame(width: 46,height: 46)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(8)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: enterValue[index]) { newValue in
                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
                            if currentValue[0] == Character(oldValue) {
                                enterValue[index] = String(enterValue[index].suffix(1))

                            } else {
                                enterValue[index] = String(enterValue[index].prefix(1))
                            }
                        }
                        if !newValue.isEmpty {
                            if index == numberOfFields - 1 {
                                fieldFocus = nil
                            } else {
                                fieldFocus = (fieldFocus ?? 0) + 1
                            }
                        } else {
                            fieldFocus = (fieldFocus ?? 0) - 1
                        }
                    }
            }
        }
    }
}

struct OTPTextField_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextField(numberOfFields: 6, enterValue: .constant(Array(repeating: "", count: 6)))
            .previewLayout(.sizeThatFits)
    }
}

