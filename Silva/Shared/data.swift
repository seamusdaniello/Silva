//
//  Data.swift
//  WeatherX
//
// Class used to load in data utilized by other
// swift files in this project.
//
//  Created by Seamus Daniello on 4/26/21.
//

import SwiftUI

// a struct of search variables that align with
// JSON names in the DONKI Solar Flare API.

struct Post: Codable, Identifiable {
    let id = UUID()
    var flrID: String
    var beginTime: String
    var peakTime: String
    var classType: String
    var sourceLocation: String
    var link: String
}

// a class uesd to retrieve information from the NASA
// API through JSON decoding. This will then be ported
// into PostList.swift to display information in a neat
// and sorted way.

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://api.nasa.gov/DONKI/FLR?api_key=stCuy2oFbnQPUrGEhoXnYQE1mfjlqzLlS5PzqHoY") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }
        .resume()
    }
}
