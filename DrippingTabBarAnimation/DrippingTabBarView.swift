//
//  DrippingTabBarView.swift
//  DrippingTabBarAnimation
//
//  Created by Lokeswari Satyanarayana on 19/02/22.
//

import SwiftUI

struct DrippingTabBarItem<Label: View>: View {
    
    let tabItemWidth: CGFloat
    
    @Binding var activeTabIndex: Int
    @Binding var selectedTabIndex: Int
    @ViewBuilder var label: Label
    
    var onPressTabBarItem: () -> Void
    
    var body: some View {
        Button {
            onPressTabBarItem()
        } label: {
            label
        }
        .frame(width: tabItemWidth,
               height: 44)
    }
}

struct DrippingTabBarView: View {
    
    @State var activeTabIndex = 0
    @State var selectedTabIndex = 0
    @State var isIndicatorAnimating = false
    
    private let indicatorSize: CGFloat = 44
    private let iconSize: CGFloat = 20
    
    var tabBarWidth = UIScreen.main.bounds.width - 40
    
    var tabItemWidth: CGFloat {
        return self.tabBarWidth/4
    }
    
    @ViewBuilder
    var indicator: some View {
        Image("waterdrop")
            .resizable()
            .frame(width: indicatorSize, height: indicatorSize, alignment: .center)
            .scaleEffect(isIndicatorAnimating ? 1 : 3)
            .foregroundColor(.white)
            .position(x: tabItemWidth * CGFloat((selectedTabIndex + 1))
                      + CGFloat(8*(selectedTabIndex+1))
                      - tabItemWidth/2,
                      y: isIndicatorAnimating ? 22 : -10)
            .animation(.spring(), value: selectedTabIndex)
    }
    
    var body: some View {
        ZStack {
            Color.pink
            indicator
            HStack {
                //MARK: TabItem 1
                DrippingTabBarItem(tabItemWidth: tabItemWidth, activeTabIndex: $activeTabIndex, selectedTabIndex: $selectedTabIndex) {
                    if activeTabIndex == 0 {
                        Image(systemName: "bolt.fill")
                            .font(.system(size: iconSize))
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "bolt")
                            .font(.system(size: iconSize))
                            .foregroundColor(.white)
                    }
                } onPressTabBarItem: {
                    selectedTabIndex = 0
                }
                
                //MARK: TabItem 2
                
                DrippingTabBarItem(tabItemWidth: tabItemWidth, activeTabIndex: $activeTabIndex, selectedTabIndex: $selectedTabIndex) {
                    if activeTabIndex == 1 {
                        Image(systemName: "cloud.fill")
                            .font(.system(size: iconSize))
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "cloud")
                            .font(.system(size: iconSize))
                            .foregroundColor(.white)
                    }
                } onPressTabBarItem: {
                    selectedTabIndex = 1
                }
                
                //MARK: TabItem 3
                
                DrippingTabBarItem(tabItemWidth: tabItemWidth, activeTabIndex: $activeTabIndex, selectedTabIndex: $selectedTabIndex) {
                    if activeTabIndex == 2 {
                        Image(systemName: "pawprint.fill")
                            .font(.system(size: iconSize))
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "pawprint")
                            .font(.system(size: iconSize))
                            .foregroundColor(.white)
                    }
                } onPressTabBarItem: {
                    selectedTabIndex = 2
                }
                
                //MARK: TabItem 4
                
                DrippingTabBarItem(tabItemWidth: tabItemWidth, activeTabIndex: $activeTabIndex, selectedTabIndex: $selectedTabIndex) {
                    if activeTabIndex == 3 {
                        Image(systemName: "leaf.fill")
                            .font(.system(size: iconSize))
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "leaf")
                            .font(.system(size: iconSize))
                            .foregroundColor(.white)
                    }
                } onPressTabBarItem: {
                    selectedTabIndex = 3
                }
            }
            .onChange(of: selectedTabIndex, perform: { _ in
                withAnimation(Animation.default.delay(0.2)) {
                    isIndicatorAnimating.toggle()
                }
                withAnimation(Animation.default.delay(0.4)) {
                    activeTabIndex = selectedTabIndex
                }
                withAnimation(Animation.default.delay(0.6)) {
                    isIndicatorAnimating = false
                }
            })
            .frame(width: tabBarWidth)
        }
        .cornerRadius(20)
        .edgesIgnoringSafeArea(.all)
        .frame(height: 80)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
