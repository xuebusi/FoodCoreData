//
//  FoodCoreDataApp.swift
//  FoodCoreData
//
//  Created by shiyanjun on 2023/8/1.
//

import SwiftUI

@main
struct SampleCoreDataApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.context)
        }
    }
}
