//
//  CustomTextField.swift
//  InstagramSwiftUI
//
//  Created by Hai Dev on 07/12/2021.
//

import SwiftUI

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct CustomTextField: View {
    
    var isSecure: Bool
    var placeholder: Text
    @Binding var field: String
    var prompt: String
    @FocusState private var isFieldIsFocused: Bool
    @State var isInit: Bool = true
    @State var editingFlag = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                
                if field.isEmpty { placeholder.padding(.horizontal ,10) }
                if isSecure {
                    SecureField("", text: $field)
                        .onTapGesture {
                            if isInit {
                                isInit = false
                            }
                        }
                        .focused($isFieldIsFocused)
                        .foregroundColor(.white)
                        .padding(.horizontal,10)
                        .padding(.vertical, 15)
                        .autocapitalization(.none)
                        .background(Color(#colorLiteral(red: 0.5876374841, green: 0.5330417156, blue: 0.9350501299, alpha: 0.5)))
                } else {
                    
                    TextField("", text: $field,  onEditingChanged: { (editingChanged) in
                        if editingChanged {
                            self.editingFlag = editingChanged
                            if isInit {
                                isInit = false
                            }
                        }
                    })
                        .focused($isFieldIsFocused)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 15)
                        .autocapitalization(.none)
                        .background(Color(#colorLiteral(red: 0.5876374841, green: 0.5330417156, blue: 0.9350501299, alpha: 0.5)))
                }
                
            }
            .padding(.bottom, 2)
            if isFieldIsFocused {
                Text("").frame(height: 3)
            } else if (!isInit) {
                    Text(prompt)
                        .foregroundColor(.red)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.caption)
                        .frame(height: 3)
            } else {
                Text("").frame(height: 3)
            }
        }
    }
}
    
