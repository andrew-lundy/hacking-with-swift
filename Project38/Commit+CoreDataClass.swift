//
//  Commit+CoreDataClass.swift
//  Project38
//
//  Created by Andrew Lundy on 11/23/20.
//
//

import Foundation
import CoreData

@objc(Commit)
public class Commit: NSManagedObject {
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
        print("Init called")
    }
}
