//
//  NutritionFactsView.swift
//  Nutrivurv
//
//  Created by Dillon P on 8/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI
import SkeletonUI

struct NutritionFactsView: View {
    @Binding var showNutrients: Bool
    @ObservedObject var nutritionFacts: NutritionFacts
    
    var bgColor = UIColor(named: "nutrition-facts-bg")!
    var shadowColor = UIColor(named: "daily-vibe-shadow")!
    
    var multiplier = UIScreen.main.bounds.height / 750
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color(bgColor))
                .shadow(color: Color(shadowColor), radius: 8, y: -3)
            
            VStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 40, height: 6)
                    .foregroundColor(Color(UIColor(named: "modal-drag-indicator")!))
                    .padding(EdgeInsets(top: 14, leading: 0, bottom: -8, trailing: 0))
                
                VStack(spacing: 8) {
                    Text("nutrition Facts")
                        .font(Font.custom("Gaoel", size: 16))
                        .frame(width: UIScreen.main.bounds.width - 60, alignment: .leading)
                    
                    NutrientView(name: "Calories", count: nutritionFacts.calories, unit: "", pct: nil)
                        .skeleton(with: nutritionFacts.isLoading == true)
                        .shape(type: .capsule)
                        .appearance(type: .gradient())
                        .animation(type: .linear())
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                    
                    Text("% Daily Value *")
                        .font(Font.custom("QuattrocentoSans-Italic", size: 12))
                        .frame(width: UIScreen.main.bounds.width - 60, alignment: .trailing)
                    
                    
                    // Maximum of 10 components per view
                    VStack(spacing: 8) {
                        NutrientView(name: "Total Fat", count: nutritionFacts.totalFat, unit: "g", pct: nutritionFacts.totalFatDailyPct)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Sodium", count: nutritionFacts.sodium, unit: "mg", pct: nutritionFacts.sodiumDailyPct)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Total Carbohydrate", count: nutritionFacts.totalCarb, unit: "g", pct: nil)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Cholesterol", count: nutritionFacts.cholesterol, unit: "mg", pct: nutritionFacts.cholesterolDailyPct)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Sugar", count: nutritionFacts.sugar, unit: "g", pct: nil)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Protein", count: nutritionFacts.protein, unit: "g", pct: nil)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Vitamin D", count: nutritionFacts.vitaminD, unit: "µg", pct: nutritionFacts.vitaminDDailyPct)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Calcium", count: nutritionFacts.calcium, unit: "mg", pct: nutritionFacts.calciumDailyPct)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Iron", count: nutritionFacts.iron, unit: "mg", pct: nutritionFacts.ironDailyPct)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                        
                        NutrientView(name: "Potassium", count: nutritionFacts.potassium, unit: "mg", pct: nutritionFacts.potassiumDailyPct)
                            .skeleton(with: nutritionFacts.isLoading == true)
                            .shape(type: .capsule)
                            .appearance(type: .gradient())
                            .animation(type: .linear())
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: multiplier * 20)
                    }
                }.frame(alignment: .top)
                    .offset(y: 20)
                Spacer()
            }
        }.onTapGesture {
            withAnimation(.easeInOut) {
                self.showNutrients.toggle()
            }
        }
    }
}


struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionFactsView(showNutrients: .constant(true), nutritionFacts: NutritionFacts())
    }
}

struct NutrientView: View {
    var name: String
    var count: Double?
    var unit: String
    var pct: Double?
    
    var body: some View {
        var countLabel = "-"
        var pctLabel = "0"
        var unitLabel = ""
        
        if let count = count {
            if count != 0 {
                countLabel = String(format: "%.1f", count)
                unitLabel = unit
            }
            
            if name == "Calories" {
                countLabel = String(format: "%.0f", count)
            }
        }
        
        if let pct = pct {
            if pct != 0 {
                pctLabel = String(format: "%.1f", pct)
            }
        }
        
        return HStack {
            Text(name)
                .font(Font.custom("QuattrocentoSans-Italic", size: 16))
            Spacer()
            Text("\(countLabel)\(unitLabel)")
                .font(Font.custom("QuattrocentoSans-Italic", size: 16))
            
            // Edamam does not provide percent values for calories, sugar, and protein properties
            // This if statement ensures the percent label is not displayed for these properties
            if pct != nil {
                Text("\(pctLabel)%")
                    .font(Font.custom("QuattrocentoSans-Italic", size: 16))
            }
            
        }.frame(width: UIScreen.main.bounds.width - 60, alignment: .leading)
    }
}
