//
//  SideMenuView.swift
//  Silva
//
//  Created by Seamus Daniello on 4/19/21.
//

import SwiftUI

// struct constructed to detail the aesthetic areas
// of the side menu. Details the colors, font-style, and
// headers used in this navigation menu. Additionally, it
// determines the destination of the navigation panel.

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @State private var showingFlares = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).ignoresSafeArea()
        }
        
        ZStack {

            VStack {
                // Header
                SideMenuHeaderView(isShowing: $isShowing)
                    .foregroundColor(.white)
                    .frame(height: 240)
                
                // Used to navigate the side menu option.
                
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    NavigationLink(
                        destination:

                            PostList(),
                        label: {
                            SideMenuOptionView(viewModel: option)
                        })
                }
                
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}


// a preview struct for the sidemenu functionality.
// used for development purposes.

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
