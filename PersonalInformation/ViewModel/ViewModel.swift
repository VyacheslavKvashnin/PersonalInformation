//
//  Model.swift
//  PersonalInformation
//
//  Created by Вячеслав Квашнин on 22.11.2021.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var childs = [Child]()
    
    func addChild(name: String, age: String) {
        if childs.count <= 4 {
            self.childs.append(Child(nameChild: name, ageChild: age))
        }
    }
}
