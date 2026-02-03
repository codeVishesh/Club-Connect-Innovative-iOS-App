//
//  ListItems.swift
//  Club_Connect
//
//  Created by student on 26-04-2024.
//
import Foundation

struct FeedsList {
    let eventName: String
    let clubName: String
    let image: String
    let description: String
    let eventDate: Date
    let registrations: Int
    let category: String
}

struct EventDataManager {
    private var events: [FeedsList]
    static let shared = EventDataManager()
   // let home = HomeViewController()
    
    
    lazy var today: Date = Date()
       
 
       lazy var endOfCurrentWeek: Date = {
           let startOfCurrentWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
           return Calendar.current.date(byAdding: .weekOfYear, value: 1, to: startOfCurrentWeek)!
       }()

    
    init() {
        self.events = [
            FeedsList(eventName: "  Code-athon", clubName: "Club 1", image: "codeathon", description: "Get ready for a afternoon filled with coding and wit as Chitkara University proudly presents the Code-A-Thon  on stage…", eventDate: Date(timeIntervalSinceNow: 1720000000), registrations: 100, category: "tech"),
//            EventList(eventName: "  Fisher Mumbai India", clubName: "Club 2", image: "FisherMumbaiIndia", description: "Description of Event 2", eventDate: Date(timeIntervalSinceNow: 86400000), registrations: 200, category: "sports"),
            FeedsList(eventName: "  Pitaara Nights", clubName: "Club 3", image: "Pitaara", description: "Pitaara nights a night of music fiesta and more  , that truggers the sensations of pleasure and wellbeing , amusement , joy ....", eventDate: Date(timeIntervalSinceNow: 863400000), registrations: 150, category: "sports"),
            
//dj  dj1
            FeedsList(eventName: "  Robotics", clubName: "Club 3", image: "robots", description: "The Global robot-to-humanThe Global robot-to-humanThe Global robot-to-humanThe Global robot-to-humanThe Global robot-to-humanThe Global robot-to-human ", eventDate: Date(timeIntervalSinceNow: 86300000), registrations: 150, category: "sports"),
            
            FeedsList(eventName: "   Dance Competetion", clubName: "Club 3", image: "DANCE", description: "Dance comptetion a night of music fiesta and more  , that truggers the sensations of pleasure and wellbeing , amusement , joy ....", eventDate: Date(timeIntervalSinceNow: 123), registrations: 150, category: "Sports"),
            FeedsList(eventName: "   Hackathon", clubName: "Club 3", image: "hack", description: "The Global robot-to-humanThe Global robot-to-humanThe Global robot-to-humanThe Global robot-to-humanThe Global robot-to-humanThe Global robot-to-human", eventDate: Date(timeIntervalSinceNow: 60), registrations: 150, category: "expert-Talk"),
            FeedsList(eventName: "   DJ Night", clubName: "Club 3", image: "dj", description: "Dance comptetion a night of music fiesta and more  , that truggers the sensations of pleasure and wellbeing , amusement , joy ....", eventDate: Date(timeIntervalSinceNow: 123), registrations: 150, category: "techi"),
            
            FeedsList(eventName: "  Annual Soprts Fest ", clubName: "Club 3", image: "SPOR", description: "Dance comptetion a night of music fiesta and more  , that truggers the sensations of pleasure and wellbeing , amusement , joy ....", eventDate: Date(timeIntervalSinceNow: 123), registrations: 150, category: "expert-Talk"),
            
            
            
            
//            ListItem(title: "VOLLEY VENTURE", image: "sports"),
            

//            ListItem(title: "THE NEW BUSINESS IDEAS", image: "imag9"),
//            ListItem(title: "THE HOUR OF <CODE> WAR ", image: "image7"),
            

//            ListItem(title: "FUTURE OF MANAGEMENT EDU ", image: "Madhu")
            
            
        ]
    }
    
    func getCurrentDate() -> Date {
        return Date()
    }
    
    
    func getRecommendedEvents() -> [FeedsList] {
        let priorityEvents = events.sorted { $0.registrations > $1.registrations }
        return priorityEvents
    }
    
    func fetchLatestEvents(forCategory categories: [String]) -> [FeedsList] {
    //    let index = 0
        let filteredEvents = events.filter { event in
            return categories.contains(event.category)

        }
            .sorted { event1, event2 in
            return event1.eventDate > event2.eventDate
        }

        var uniqueEventTitles = Set<String>()
        var recommendedEvents: [FeedsList] = []
        
        for event in filteredEvents {
            if !uniqueEventTitles.contains(event.eventName) {
                uniqueEventTitles.insert(event.eventName)
                recommendedEvents.append(event)
            }
        }
        
        return recommendedEvents
    }
    

    
    mutating func fetchEventDataForThisWeek() -> [FeedsList] {
        let filteredEvents = events.filter { event in
            return event.eventDate > today && event.eventDate <= endOfCurrentWeek
        }
        
        return filteredEvents.map { event in
            return event
        }
    }

//    mutating 

}
