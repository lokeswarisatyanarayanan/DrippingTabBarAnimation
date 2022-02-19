//
//  View+Extension.swift
//  DrippingTabBarAnimation
//
//  Created by Lokeswari Satyanarayana on 19/02/22.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
