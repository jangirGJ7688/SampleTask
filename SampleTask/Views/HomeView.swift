//
//  HomeView.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 02/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var selection: Int = 1
    @StateObject var vm: HomeViewModel = HomeViewModel()
    
    init() {
    // Sets the background color of the Picker
        UISegmentedControl.appearance().backgroundColor = .white
    // Disappears the divider
       UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    // Changes the color for the selected item
        UISegmentedControl.appearance().selectedSegmentTintColor = AppConstants().rgba(14, 111, 255)
    // Changes the text color for the selected item
       UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var body: some View {
        VStack {
            DeshboardView()
            ZStack {
                if vm.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color(AppConstants().rgba(14, 11, 255))))
                        .scaleEffect(2)
                        .background(Color.white)
                }else {
                    ScrollView {
                        VStack {
                            HStack {
                                Text(AppConstants().greetingLogic())
                                    .font(.custom("Figtree-Regular", size: 16))
                                    .foregroundColor(Color(AppConstants().rgba(153, 156, 160)))
                                Spacer()
                            }
                            .padding(.bottom,-5)
                            HStack {
                                Text("Ganpat Jangir")
                                    .font(.custom("Figtree-Medium", size: 24))
                                Image("hand")
                                    .resizable()
                                    .frame(width: 28,height: 28)
                                Spacer()
                            }
                            HomeChartView(data: vm.homeData?.charData ?? [:])
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(vm.homeData?.horizontalData ?? [],id: \.key){ item in
                                        HorizontalScrollView(item: item)
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                            .padding(.top,10)
                            Picker("", selection: $selection) {
                                Text("Top Links")
                                    .font(.custom("Figtree-SemiBold", size: 16))
                                    .tag(1)
                                Text("Recent Links")
                                    .font(.custom("Figtree-SemiBold", size: 16))
                                    .tag(2)
                            }
                            .pickerStyle(.segmented)
                            .padding(.vertical,20)
                            if let links = selection == 1 ?  vm.homeData?.top_links : vm.homeData?.recent_links as? [LinkItem] {
                                ForEach(links) { link in
                                    LinkItemView(item: link)
                                }
                            }
                        }
                        .padding(.horizontal,24)
                        .padding(.top,32)
                    }
                    .background(Color(AppConstants().rcode(245)))
                    .cornerRadius(16.0)
                    .edgesIgnoringSafeArea(.all)
                    .refreshable {
                        vm.getHomeData()
                    }
                }
            }
        }
        .background(Color(AppConstants().rgba(14, 11, 255)))
        .onAppear {
            vm.getHomeData()
        }
    }
}

#Preview {
    HomeView()
}




