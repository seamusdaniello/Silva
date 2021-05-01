//
//  SideMenuViewModel.swift
//  Silva
//
// Titles for navigation components are listed here.
// Currently there is only one as this application
// only supports the occurrence of solar flares.
//
//  Created by Seamus Daniello on 4/19/21.
//

import Foundation

// Used to create navigation names in the SideViewMenu.swift.
// All options in the switch statement will be displayed in
// the side navigation menu.

enum SideMenuViewModel: Int, CaseIterable {
    case flares
    
    var title: String {
        switch self {
            case .flares: return "YOUR FLARE FORECAST"
        }
    }
    
    var imageName: String {
        switch self {
        case .flares: return "sun.min.fill"
        }
    }
    
}
