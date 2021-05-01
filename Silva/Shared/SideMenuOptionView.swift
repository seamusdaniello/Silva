//
//  SideMenuOptionView.swift
//  Silva
//
// Data from the data.swift class is loaded in here for
// the available options in the navigation tab.
//
//  Created by Seamus Daniello on 4/19/21.
//

import SwiftUI

// Used to model the side menu that will be displayed
// in the navigation menu.

struct SideMenuOptionView: View {
    @State var isActive: Bool = false
    
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 24)
            
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
                .animation(.easeOut(duration: 0.2))
                .gesture(DragGesture(minimumDistance: 0)
                            .onChanged({ _ in
                                self.isActive = true
                            })
                            .onEnded({ _ in
                                self.isActive = false
                            }))
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
        
    }
}

// a preview structure for SideMenuOptionView

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .flares)
    }
}
