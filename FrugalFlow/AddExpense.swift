//
//  AddExpense.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-11.
//

import SwiftUI

struct AddExpense: View {
    
    @AppStorage("expense_food") var food = 0.00
    @AppStorage("expense_healthcare") var healthcare = 0.00
    @AppStorage("expense_transportation") var transportation = 0.00
    @AppStorage("expense_shopping") var shopping = 0.00
    @AppStorage("expense_payments") var payments = 0.00
    @AppStorage("expense_saving") var saving = 0.00
    
    
    @AppStorage("expence_key") var expenseStore = 0.00
    
    @State private var categ_id = 0
    @State private var amount = ""
    
    @State private var showAlert = false
    @State private var showNavigationToNextView = false
    
    @State private var selectedCategoryIndex = 0
    
    var categories = ["Food", "Healthcare", "Transportation", "Shopping", "Payments", "Savings"]
    
    var body: some View {
        ZStack {
            Color(red: 250/255, green: 250/255, blue: 250/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Form {
                    Section {
                        Picker(selection: $selectedCategoryIndex, label: Text("Category")) {
                            ForEach(0..<categories.count) { index in
                                Text(self.categories[index]).tag(index)
                                
                            }
                        }.onChange(of: selectedCategoryIndex) { newValue in
                            //categ_id = 0
                            print("Selected category: \(newValue)")
                            categ_id = newValue
                        }
                        
                        TextField("Amount", text: $amount).keyboardType(.numberPad)
                    }
                    
                    
                    
                }.frame(width: 280, height: 200)
                
                NavigationLink(destination: TabBarView(), isActive: $showNavigationToNextView) {
                    EmptyView()
                }
                
                Button(action: {
                    
                    if amount.isEmpty{
                        showAlert = true
                    }
                    else{
                        showAlert = false
                        
                        print("Selected category index: \(selectedCategoryIndex)")
                        
                        switch selectedCategoryIndex {
                        case 0: food += Double(amount) ?? 0
                        case 1: healthcare += Double(amount) ?? 0
                        case 2: transportation += Double(amount) ?? 0
                        case 3: shopping += Double(amount) ?? 0
                        case 4: payments += Double(amount) ?? 0
                        case 5: saving += Double(amount) ?? 0
                        default: break
                        }
                        
                        expenseStore+=Double(amount) ?? 0
                        
                        showNavigationToNextView = true
                    }
                    
                    
                }) {
                    Text("Add Expense")
                        .frame(width: 300, height: 60)
                        .background(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .padding(.top)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                }
                                
                
                NavigationLink(destination: TabBarView(), label: {
                    Text("Cancel")
                        .frame(width: 200, height: 60)
                        .background(.gray)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .padding(.top)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                })
                
                
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Warning!"), message: Text("Amount cannot be empty"), dismissButton: .default(Text("OK")))}
        }.navigationBarTitle("Add Expense")
    }
}

struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense()
    }
}
