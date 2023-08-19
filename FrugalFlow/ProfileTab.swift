//
//  ProfileTab.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-09.
//

import SwiftUI

struct ProfileTab: View {
    
    @State private var showAlert = false
    @State private var showNavigationToNextView = false
    
    @AppStorage("age_key") var ageStore = 0
    @AppStorage("salary_key") var salaryStore = 0.00
    @AppStorage("posttaxsalary_key") var postTaxSalary = 0.00
    @AppStorage("tax_key") var taxStore = 0.00
    @AppStorage("name_key") var nameStore = ""
    @AppStorage("register_key") var register = false
    
    @AppStorage("expense_food") var food = 0.00
    @AppStorage("expense_healthcare") var healthcare = 0.00
    @AppStorage("expense_transportation") var transportation = 0.00
    @AppStorage("expense_shopping") var shopping = 0.00
    @AppStorage("expense_payments") var payments = 0.00
    @AppStorage("expense_saving") var saving = 0.00
    
    @AppStorage("expence_key") var expenseStore = 0.00

    var calPostTaxSalary: Double{
        postTaxSalary = salaryStore - taxStore
        return postTaxSalary
    }
    
    
    var body: some View {
        ZStack{
            Color(red: 250/255, green: 250/255, blue: 250/255)
                .edgesIgnoringSafeArea(.all)

            VStack{
                Text("Profile")
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
                        Text("Rs. " + String(format: "%.2f", taxStore))
                            .font(.system(size: 18, weight: .bold, design: .default))

                    })
                    
                    Section(header: Text("After Taxes"), content: {
                        Text("Rs. " + String(format: "%.2f",calPostTaxSalary))
                            .font(.system(size: 18, weight: .bold, design: .default))
                    })
                    
                }
                .padding(.horizontal, 30)
                .frame(height: 500)
                .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                
                
                Spacer()
                
                
            }
            VStack{
                Spacer()
                
                
                NavigationLink(destination: SplashScreenView(), isActive: $showNavigationToNextView) {
                    EmptyView()
                }
                
               
                Button(action: {
                    showAlert = true
                }) {
                    Text("Delete")
                        .frame(width: 300, height: 60)
                        .background(Color(red: 16/255, green: 44/255, blue: 87/255))
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .padding(.top)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Account Delete!"),
                        message: Text("Do you want to Delete your account?"),
                        primaryButton: .default(Text("Delete")) {
                            
                            nameStore = ""
                            ageStore = 0
                            salaryStore = 0.00
                            taxStore = 0.00
                            register = false
                            food = 0.00
                            healthcare = 0.00
                            transportation = 0.00
                            shopping = 0.00
                            payments = 0.00
                            saving = 0.00
                            
                            expenseStore = 0.00
                            
                            showNavigationToNextView = true
                            
                        },
                        secondaryButton: .destructive(Text("Cancel")) {
                            
                        }
                        
                    )
                }



                
                
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    
    
}

struct ProfileTab_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTab()
    }
}
