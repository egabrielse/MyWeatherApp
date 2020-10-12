//
//  UserEntity+CoreDataProperties.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/12/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var isMetric: Bool
    @NSManaged public var cities: [String]?

}
