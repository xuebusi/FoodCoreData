//
//  DataController.swift
//  FoodCoreData
//
//  Created by shiyanjun on 2023/8/1.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    // Responsible for preparing a model
    //    let container = NSPersistentContainer(name: "FoodModel")
    //
    //    init() {
    //        container.loadPersistentStores { description, error in
    //            if let error = error {
    //                print("Failed to load data in DataController \(error.localizedDescription)")
    //            }
    //        }
    //    }
    
    private static var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FoodModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return Self.container.viewContext
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully. WUHU!!!")
        } catch {
            // Handle errors in our database
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext) {
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
}
