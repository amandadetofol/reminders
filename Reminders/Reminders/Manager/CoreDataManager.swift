//
//  CoreDataManager.swift
//  Reminders
//
//  Created by Amanda Detofol on 19/07/22.
//

import CoreData

class CoreDataManager {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addReminderInCoreData(_ reminder: Reminder) {
        let coreDataReminder = self.parseReminderToCoreDataReminder(reminder)
        saveContext()
    }
    
    func getItemsFromDatabase() -> [Reminder]{
        var reminders: [Reminder] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ReminderCoreData")
        do {
            if let results = try persistentContainer.viewContext.fetch(fetchRequest) as? [NSManagedObject] {
                for result in results {
                    if let title = result.value(forKey: "title") as? String,
                       let description = result.value(forKey: "reminderDescription") as? String,
                        let date = result.value(forKey: "date") as? Date,
                        let priority = result.value(forKey: "priority") as? String {
                        
                        reminders.append(Reminder(title: title,
                                                description: description,
                                                priority: self.selectPriority(basedOn: priority),
                                                dateToShow: date.parseToFormattedString(),
                                                date: date))
                        
                    }
                }
            }
        } catch {
            print("Failed to fetch data request.")
        }
        
        return reminders
    }
    
}

extension CoreDataManager {
    
    private func parseReminderToCoreDataReminder(_ reminder: Reminder) -> ReminderCoreData {
        let coreDataReminder = ReminderCoreData(context: self.persistentContainer.viewContext)
        coreDataReminder.date = reminder.date
        coreDataReminder.title = reminder.title
        coreDataReminder.reminderDescription = reminder.description
        coreDataReminder.priority = reminder.priority.string
        return coreDataReminder
    }

}

extension CoreDataManager {
    
    func selectPriority(basedOn string: String) -> Priority {
        switch string.lowercased() {
        case "high":
            return .high
        case "medium":
            return .medium
        case "low":
            return .low
        default:
            return .low
        }
    }
    
}
