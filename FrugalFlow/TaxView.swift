//
//  TaxView.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-09.
//

import SwiftUI

struct TaxView: View {
    
    @AppStorage("age_key") var ageStore = 0
    @AppStorage("salary_key") var salaryStore = 0.00
    @AppStorage("tax_key") var taxStore = 0.00
    @AppStorage("name_key") var nameStore = ""
    @AppStorage("register_key") var register = false
    
    @State private var showAlert = false
    @State private var showNavigationToNextView = false
    
    var body: some View {
        ZStack{
            Color(red: 242/255, green: 242/255, blue: 247/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Account")
                    .font(.system(size: 30, weight: .bold, design: .default))
                
                
                Form{
                    Section(header: Text("Name"), content: {
                        Text(String(nameStore))
                            .font(.system(size: 18, weight: .bold, design: .default))
                    })
                    
                    Section(header: Text("Age"), content: {
                        Text(String(ageStore) + " Years")
                            .font(.system(size: 18, weight: .bold, design: .default))
                    })
                    
                    Section(header: Text("Income"), content: {
                        Text("Rs. " + String(format: "%.2f",salaryStore))
                            .font(.system(size: 18, weight: .bold, design: .default))
                    })
                    
                    Section(header: Text("Calculated Tax"), content: {
                        Text("Rs. " + String(format: "%.2f",taxStore))
                            .font(.system(size: 18, weight: .bold, design: .default))
                    })
                    
                    Section(header: Text("After Taxes"), content: {
                        Text("Rs. " + String(format: "%.2f",salaryStore-taxStore))
                            .font(.system(size: 18, weight: .bold, design: .default))
                    })
                    
                }
                .padding(.horizontal, 30)
                .frame(height: 500)
                
                Spacer()
            }
            
            VStack{
                Spacer()
                NavigationLink(destination: TabBarView(), isActive: $showNavigationToNextView) {
                    EmptyView()
                }
                
                Button("Get Started") {
                    register = true
                    
                    print(register)
                    print(nameStore)
                    print(ageStore)
                    print(salaryStore)
                    print(taxStore)
                    
                    showAlert = false
                    showNavigationToNextView = true
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
        }.navigationBarBackButtonHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Warning!"), message: Text("Name cannot be empty"), dismissButton: .default(Text("OK")))
            }
        
        
    }
}
struct TaxView_Previews: PreviewProvider {
    static var previews: some View {
        TaxView()
    }
}
