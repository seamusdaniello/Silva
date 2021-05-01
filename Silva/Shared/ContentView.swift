//
//  ContentView.swift
//  Shared
//
//
// All supporting swift files are placed here for
// the view in which the user will see. This is the front-end
// component of the application.
//
//  Created by Seamus Daniello on 4/13/21.
//
// Displays the front page of the application and acts as the main navigation page.


import SwiftUI
import Combine

// ContentView acts as the main page view without utilizing any of the available navigation functions.

// struct ContentView contains what is directly presented to the user.

struct ContentView: View {
    @State private var isShowing = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                if isShowing {
                    SideMenuView(isShowing: $isShowing)
                }
                
                HomeView()
                    .cornerRadius(isShowing ? 20 : 10)
                    .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()) {
                            isShowing.toggle()
                        }
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                    }))
                    .navigationTitle("Home")
        }
            
        }
        
    }
}

// a preview function for what is seen at the front of the
// application.

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// struct created for designing the front-end components and
// display of the application. This is what is immediately
// seen when the user opens this application.

struct HomeView: View {
    @State var date = Date()
    
    var body: some View {
        ZStack {
            Color(.white)
            ZStack {
                VStack {
                    
                    Link("More About DONKI", destination: URL(string: "https://ccmc.gsfc.nasa.gov/support/DONKI-webservices.php")!)
                        .font(.system(size: 21))
                            .padding(100)
                            .foregroundColor(.white)
                            .background(
                                Image("space3")
                                    .resizable()).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                    Text("Solar Forecast").font(.system(size: 31))
                        .bold()
                        .padding(100)
                        .foregroundColor(.white)
                        .background(
                            Image("space2")
                                .resizable()).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                        
                        Link("Recruitment Page", destination: URL(string: "https://www.nasa.gov/audience/forstudents/postsecondary/features/F_Astronaut_Requirements.html")!)
                            .font(.system(size: 21))
                                .padding(100)
                                .foregroundColor(.white)
                                .background(
                                    Image("space")
                                        .resizable()).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                }
                
            }
                    }
                    .navigationBarItems(leading: Button(action: {print("DEBUG: Show menu here...")
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                    }))
        .navigationTitle("Launch Site").foregroundColor(.white)
    }

}


