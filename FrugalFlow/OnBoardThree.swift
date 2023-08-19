//
//  OnBoardThree.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-08.
//

import SwiftUI

struct OnBoardThree: View {
    
    @State private var salary = ""
    @State private var showAlert = false
    @State private var showNavigationToNextView = false
    
    @AppStorage("age_key") var ageStore = 0
    @AppStorage("salary_key") var salaryStore = 0.00
    @AppStorage("originalsalary_key") var originalSalaryStore = 0.00
    @AppStorage("tax_key") var taxStore = 0.00
    @AppStorage("name_key") var nameStore = ""
    
    @State private var income: Double = 0
    @State private var calculatedTax: Double = 0
    
    func calculateTax() {
        let baseTax = 41667 * 0.06
        let remainingIncome = salaryStore - 100000
        
        if remainingIncome <= 0 {
            calculatedTax = 0
        } else if remainingIncome <= 41667 {
            calculatedTax = remainingIncome * 0.06
        } else if remainingIncome <= 41666 + 41667 {
            calculatedTax = baseTax + (remainingIncome - 41667) * 0.12
        } else if remainingIncome <= 41667 + 41667 + 41667 {
            calculatedTax = baseTax + 41666 * 0.12 + (remainingIncome - (41667 + 41667)) * 0.18
        } else if remainingIncome <= 41667 + 41667 + 41667 + 41667 {
            calculatedTax = baseTax + 41666 * 0.12 + 41667 * 0.18 + (remainingIncome - (41667 + 41667 + 41667)) * 0.24
        } else if remainingIncome <= 41667 + 41667 + 41667 + 41667 + 41667 {
            calculatedTax = baseTax + 41666 * 0.12 + 41667 * 0.18 + 41667 * 0.24 + (remainingIncome - (41667 + 41667 + 41667 + 41667)) * 0.30
        } else {
            calculatedTax = baseTax + 41666 * 0.12 + 41667 * 0.18 + 41667 * 0.24 + 41667 * 0.30 + (remainingIncome - (41667 + 41667 + 41667 + 41667 + 41667)) * 0.36
        }
    }
    
    var body: some View {
        ZStack{
            Color(red: 250/255, green: 255/255, blue: 255/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Step 3/3")
                    .foregroundColor(.gray)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .padding(.top, 20)
                
                ProgressView(value: 1)
                    .tint(.black)
                    .padding(.top)
                    .padding(.horizontal, 30)
                
                Text("What is your Salary?")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .light, design: .default))
                    .padding(.top, 20)
                
                TextField("Sri Lankan Rupees", text: $salary)
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .frame(width: 280, height: 80)
                    .border(Color.black, width: 1)
                    .padding(.top, 60)
                    .keyboardType(.numberPad)
                
                Spacer()
                
                NavigationLink(destination: TaxView(), isActive: $showNavigationToNextView) {
                    EmptyView()
                }
            }
            .offset(y: -51)
            
            VStack{
                Spacer()
                Button("Next") {
                    if salary.isEmpty {
                        showAlert = true
                    } else {
                        
                        salaryStore = Double(salary)!
                        originalSalaryStore = Double(salary)!
                        calculateTax()
                        taxStore = calculatedTax
                        
                        print(ageStore)
                        print(nameStore)
                        print(salaryStore)
                        print(taxStore)
                        
                        showAlert = false
                        showNavigationToNextView = true
                    }
                }
                .frame(width: 300, height: 60)
                .background(Color(red: 16/255, green: 44/255, blue: 87/255))
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
                .cornerRadius(15)
                .padding(.top)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            }
            
        }
        .accentColor(Color(.label))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Warning!"), message: Text("Salary cannot be empty"), dismissButton: .default(Text("OK")))
            
            
        }
    }
    
}
struct OnBoardThree_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardThree()
    }
}

