//
//  PostList.swift
//  WeatherX
//
//  Created by Seamus Daniello on 4/26/21.
//
// Uses the data in data.swift and develops structs
// that will cleanly present the information on an application
// page.

import SwiftUI

// struct used to display forecast data for Solar Flares.
// Displays information regarding the time, location,
// and identification number.

struct PostList: View {
    @State var posts: [Post] = []
    
    var body: some View {
        
        // Presents the header, displaying the two
        // most essential elements of solar weather:
        // the start time and location of the solar
        // storm.
        
        Text("Solar Flares")
            .font(.system(size: 65))
            .padding(5)
            .foregroundColor(.white)
            .background(Image("space3"))
        
        HStack {
        
            VStack {
            
        Text("Start Time").font(.system(size: 25))
            .padding(35)
            .foregroundColor(.white)
                
            }
            
            VStack {
        
        Text("Location").font(.system(size: 25))
            .padding(40)
            .foregroundColor(.white)
                
            }
            
        }
        
        HStack {
        
        List(posts) { post in
            
            VStack {
            
            HStack {
            
                Text(post.beginTime)
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.black).padding(16)
                
            Text(post.sourceLocation)
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black).padding(16)
                
            }
                
                // Classification elements of the Solar
                // storms are displayed here, including
                // identification numbers and class types.
                
                VStack {
                    
                    HStack {
                        
                        Text("Flare ID: ")
                            .bold()
                    
            Text(post.flrID)
            .font(.system(size: 16))
                .foregroundColor(.black)
                        
                    }.frame(width: 300, height: 50, alignment: .topLeading)
            
                    HStack(alignment: .lastTextBaseline) {
                        
            Text("Peak Time: ")
                .bold()
                .frame(alignment: .topLeading)
                    
            Text(post.peakTime)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .frame( alignment: .topLeading)
            
                    }.frame(width: 300, height: 50, alignment: .topLeading)
                        
                    
                    HStack {
                        
            Text("Class Type: ")
                .bold()
                .frame( alignment: .topLeading)
                        
            Text(post.classType)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .frame( alignment: .topLeading)
                    }.frame(width: 300, height: 50, alignment: .topLeading)
                    
            
                }
                
            
            }
        }
            
                }.onAppear {
                    Api().getPosts { (posts) in
                        self.posts = posts
            }
            }
    }
}

// a previews struct of what is displayed in this main
// struct, PostList.

struct PostList_Preview: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
