//
//  HealthDashboardView.swift
//  Nutrivurv
//
//  Created by Dillon on 8/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct HealthDashboardView: View {
    @ObservedObject var activeCalories: Calories
    @ObservedObject var caloricDeficit: Calories
    @ObservedObject var dailyMacros: DailyMacros
    @ObservedObject var userWeightData: Weight
    
    var body: some View {
        
        return VStack {
            Text("your health")
                .font(Font.custom("Gaoel", size: 13))
                .foregroundColor(Color(UIColor(named: "light-label")!))
                .padding(.top, UIScreen.main.bounds.height * 0.065)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    CaloriesView(calories: activeCalories, title: "Active Calories", legend: "Last 7 Days", style: Styles.barChartStyleNeonBlueLight , form: ChartForm.extraLarge)
                    
                    
                    HStack {
                        CaloriesView(calories: caloricDeficit, title: "Caloric Deficit", legend: "Last 7 Days", style: Styles.barChartStyleNeonBlueLight, form: ChartForm.medium)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .foregroundColor(Color(UIColor(named: "bg-color")!))
                                .shadow(color: Color(UIColor(named: "daily-vibe-shadow")!), radius: 8.0, x: 0, y: 0)
                            
                            RingView(showRings: .constant(true), showMacrosDetail: .constant(true), uiColor: UIColor(named: "nutrivurv-blue-new")!, width: 100, height: 100, progressPercent: dailyMacros.caloriesPercent, lineWidth: 16).padding(.top, 13)
                            
                            VStack{
                                HStack {
                                    Text("calories consumed")
                                        .font(Font.custom("Gaoel", size: 14))
                                        .padding(.leading, 6)
                                    
                                    Spacer()
                                    
                                    Image("tableware")
                                        .renderingMode(.template)
                                        .foregroundColor(Color.gray)
                                        .padding(.trailing, 6)
                                    
                                }.frame(width: 160, alignment: .leading)
                                
                                Spacer()
                                
                                Text("\(Int(dailyMacros.caloriesPercent)) %")
                                    .font(Font.custom("Gaoel", size: 18))
                                
                                Spacer()
                                
                                HStack {
                                    Text("today")
                                        .font(Font.custom("Gaoel", size: 12))
                                        .foregroundColor(Color.gray)
                                        .padding(.leading, 6)
                                    
                                    Spacer()
                                    
                                    Text("\(Int(dailyMacros.caloriesCount)) cals")
                                        .font(Font.custom("Gaoel", size: 12))
                                        .foregroundColor(Color.gray)
                                        .padding(.trailing, 6)
                                    
                                }.frame(width: 160, alignment: .leading)
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 10)
                        }
                    }
                    
                    LineChartView(data: userWeightData.weightReadings, title: "Weight", legend: "last 30 days", form: ChartForm.large)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(Color(UIColor(named: "bg-color")!))
                            .shadow(color: Color(UIColor(named: "daily-vibe-shadow")!), radius: 8.0, x: 0, y: 0)
                        
                        VStack {
                            Text("what is a caloric deficit?")
                                .foregroundColor(Color(UIColor(named: "light-label")!))
                                .font(Font.custom("Gaoel", size: 14))
                                .frame(alignment: .leading)
                                .padding(.vertical, 6)
                            
                            Text("A caloric deficit is when the number of calories consumed is less than the number of total calories burned on any given day. The total calories burned is equal to the sum of both your active calories (calories burned during exercise) and your basal metabolic rate (BMR). Your BMR is the number of calories necessary for essential bodily functions, i.e. the base number of calories burned by your body every day even when you don't exercise. A caloric deficit is necessary in order to lose weight, and its currently accepted in the scientific community that one pound of fat is equivalent to roughly ~3,500 calories. This means that for every 3,500 calories in deficit, you'll lose approximately 1 pound.")
                                .foregroundColor(Color.gray)
                                .font(Font.custom("QuattrocentoSans-Bold", size: 13))
                                .frame(alignment: .leading)
                                .padding(.vertical, 6)
                        }
                        .frame(width: 320, alignment: .leading)
                        
                    }.frame(height:  260)
                    
                }
                .padding(.horizontal, 28)
                .padding(.top, 16)
                .padding(.bottom, 90)
                
            }
            .background(Color(UIColor(named: "bg-color")!))
            
            
        }.background(Color(UIColor(named: "bg-color")!))
            .edgesIgnoringSafeArea(.all)
    }
}

struct HealthDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDashboardView(activeCalories: Calories(), caloricDeficit: Calories(), dailyMacros: DailyMacros(), userWeightData: Weight())
    }
}
