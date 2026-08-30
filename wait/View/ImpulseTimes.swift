//
//  ImpulseTimes.swift
//  wait
//
//  Created by tee on 30.08.2026.
//

import Foundation

enum ImpulseTimes:Int, CaseIterable {
    case hour = 1
    case sixHours
    case day
    case twoDays
    case week
    
    var name: String {
        switch self {
            case .hour: return "1 hour"
            case .sixHours: return "6 hours"
            case .day: return "1 day"
            case .twoDays: return "2 days"
            case .week: return "1 week"
        }
    }
    
      var dateComponents: DateComponents {
        switch self {
        case .hour:
            return DateComponents(hour: 1)
        case .sixHours:
            return DateComponents(hour: 6)
        case .day:
            return DateComponents(day: 1)
        case .twoDays:
            return DateComponents(day: 2)
        case .week:
            return DateComponents(day: 7)
        }
    }
    
    func date(byAddingTo date: Date = Date(), calendar: Calendar = .current) -> Date? {
        calendar.date(byAdding: self.dateComponents, to: date)
    }
}
