//
//  TabView.swift
//  FrugalFlow
//
//  Created by Harsha Amarasinghe on 2023-08-09.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            DashboardTab()
                .tabItem{
                    Image(systemName: "chart.bar.xaxis")
                    Text("Dashboard")
                }
            InsightsTab()
                .tabItem{
                    Image(systemName: "dollarsign.circle")
                    Text("Insights")
                }
            EducationView()
                .tabItem{
                    Image(systemName: "book.fill")
                    Text("Learn")
                }
            ProfileTab()
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }.background(Color.white)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
