//
//  Home.swift
//  PersonalInformation
//
//  Created by Вячеслав Квашнин on 22.11.2021.
//

import SwiftUI

struct Home: View {
    
    @State private var namePerson = ""
    @State private var age = ""
    
    @State private var nameKid = ""
    @State private var ageKid = ""
    
    @StateObject private var model = ViewModel()
    
    @State private var showAction = false
    @State private var show = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Персональные данные")
                    .font(.title2)
                    .padding()
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Имя")
                            .foregroundColor(.gray)
                        TextField("Введите имя", text: $namePerson)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 2))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Возраст")
                            .foregroundColor(.gray)
                        TextField("Введите возраст", text: $age)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 2))
                    HStack {
                        Text("Дети (макс.5)")
                            .font(.title2)
                        Button {
                            if nameKid != "" && ageKid != "" {
                                model.addChild(name: nameKid, age: ageKid)
                            }
                            nameKid = ""
                            ageKid = ""
                            show.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                                Text("Добавить ребенка")
                            }
                            .padding()
                            .padding(.horizontal, 10)
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 2))
                        }
                        .opacity(model.childs.count <= 4 ? 1 : 0)
                    }
                    .padding(.top)
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        if show {
                            VStack {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Имя")
                                        TextField("Введите имя", text: self.$nameKid)
                                    }
                                    .frame(width: 200, alignment: .leading)
                                    .padding(.horizontal)
                                    .padding([.top, .bottom], 5)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.gray.opacity(0.2)))
                                }
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text("Возраст")
                                    TextField("Введите возраст", text: self.$ageKid)
                                }
                                .frame(width: 200, alignment: .leading)
                                .padding(.horizontal)
                                .padding([.top, .bottom], 5)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray.opacity(0.2)))
                            }
                            .padding()
                        }
                        
                        ForEach(model.childs) { i in
                            HStack {
                                ChildRow(nameChild: i.nameChild, ageChild: i.ageChild)
                                Button {
                                    if let index = model.childs.firstIndex(where: {$0.id == i.id}) {
                                        model.childs.remove(at: index)
                                    }
                                } label: {
                                    Text("Удалить")
                                }
                            }
                        
                            Divider().padding(.horizontal)
    
                        }.listStyle(PlainListStyle())
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                Button {
                    showAction = true
                } label: {
                    Text("Очистить")
                        .padding()
                        .padding(.horizontal, 50)
                        .foregroundColor(.red)
                        .overlay(RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.red, lineWidth: 2))
                }
            }
        }
        .confirmationDialog("Вы уверены?", isPresented: self.$showAction, titleVisibility: .visible) {
            Button {
                self.model.childs.removeAll()
                self.namePerson = ""
                self.age = ""
            } label: {
                Text("Сбросить данные")
            }
            Button("Отмена", role: .cancel) {}
        }
    }
}
