//
//  ChildRow.swift
//  PersonalInformation
//
//  Created by Вячеслав Квашнин on 22.11.2021.
//

import SwiftUI

struct ChildRow: View {
    let nameChild: String
    let ageChild: String
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Имя")
                            .foregroundColor(.gray)
                        Text(nameChild)
                    }
                    .frame(width: 200, alignment: .leading)
                    .padding(.horizontal)
                    .padding([.top, .bottom], 5)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2)))
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Возраст")
                        .foregroundColor(.gray)
                    Text(ageChild)
                }
                .frame(width: 200, alignment: .leading)
                .padding(.horizontal)
                .padding([.top, .bottom], 5)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.2)))
            }
        }
        .padding(.horizontal)
    }
}
