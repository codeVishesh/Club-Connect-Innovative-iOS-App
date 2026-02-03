//
//  ListSection.swift
//  Club_Connect
//
//  Created by student on 25-04-2024.
//
enum ListSection {
    case recommended([ListItem])
    case eventsThisWeek([ListItem])
    case recClubs([ListItem])
    
    var items: [Any] {
        switch self {
        case .recommended(let items):
            return items
        case .eventsThisWeek(let items):
            return items
        case .recClubs(let items):
            return items

        }
    }
        
        var count: Int {
            return items.count
        }
        
        var title: String {
            switch self {
            case .recommended:
                return "Recommended"
            case .eventsThisWeek:
                return "\n\nEvents This Week"
            case .recClubs:
                return "\n\n\nYou May Like"
            }
        }
    
}
