//
//  EventList.swift
//  FeedS
//
//  Created by Vishesh Gupta on 28/04/24.
//

import Foundation

struct FeedList {
//    var title: String
    var description: String
//    var date: Date
//    var category: String
//    var imageURL: String
  //  var clubName: String
    var imageName: String
}

class EventsThisWeek {
    var events: [FeedList] = []
    static var shared = EventsThisWeek()
    
    init() {
        self.events = [
            FeedList( description: "Description 1", imageName: "feed1"),
            FeedList(description: "Description 2", imageName: "feed2"),
            FeedList(description: "Description 3", imageName: "post_3")
        ]
    }
    
    func getAllEvents() -> [FeedList] { 
        print(self.events)
        return self.events }
    func addfeeds(feed: FeedList) {
        events.append(feed)
        
    }
}

var eventsThisWeek = EventsThisWeek()

