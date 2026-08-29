//
//  Impulse+CoreDataProperties.swift
//  wait
//
//  Created by tee on 29.08.2026.
//
//

public import Foundation
public import CoreData


public typealias ImpulseCoreDataPropertiesSet = NSSet

extension Impulse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Impulse> {
        return NSFetchRequest<Impulse>(entityName: "Impulse")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var time: Date?
    @NSManaged public var createdAt: Date?

}

extension Impulse : Identifiable {

}
