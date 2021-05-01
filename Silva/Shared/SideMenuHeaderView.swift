//
//  SideMenuHeaderView.swift
//  Silva
//
// This displays the header of the application
// showing the users own credentials and NASA's
// logo.
//
//  Created by Seamus Daniello on 4/19/21.
//

import SwiftUI

// struct created to model the header at the very top
// of the side menu. Will sit atop of the information
// constructed in SideMenuOptionView.swift and SideMenuViewModel.swift.

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing
        ) {
            Button(action: {
                withAnimation(.spring()) {
                    isShowing.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            })
        VStack(alignment: .leading) {
            Image("nasa")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.bottom, 16)
            
            Text("Seamus Daniello")
                .font(.system(size: 24, weight: .semibold))
            
            Text("Space Cadet")
                .font(.system(size:14))
                .padding(.bottom, 32)
            
            HStack(spacing: 12) {
            HStack(spacing: 4) {
                Text("DONKI").bold()
                Text("by NASA")
            }
            HStack(spacing: 4) {
            }
            
            Spacer()
        }
            Spacer()
        }.padding()
        }
    }
}

// a preview for the struct SideMenuHeaderView

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
