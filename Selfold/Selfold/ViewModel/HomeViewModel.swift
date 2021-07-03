//
//  HomeViewModel.swift
//  Selfold
//
//  Created by Cristi Cretu on 03.07.2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    @Published var points = 0
    
    @Published var isNewData = false
    
    let calendar = Calendar.current
//    func checkDate() -> String {
//        
//    }
}
