//
//  HomeViewModel.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 01/05/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var homeData: HomePageData?
    @Published var isLoading : Bool = true
    private var networkManager = NetworkManager()
    private var retry = 3
    
    func getHomeData() {
        networkManager.getDataFromAPI { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.homeData = data?.data
                    self?.homeData?.horizontalData = [
                        HoriData(key: "Top Clicks", value:"\(String(describing: data?.today_clicks ?? 0))", loco: "h1"),
                        HoriData(key: "Top Location", value: data?.top_location ?? "", loco: "h2"),
                        HoriData(key: "Top Source", value: data?.top_source ?? "", loco: "h3")
                    ]
                    self?.isLoading = false
                }
                self?.retry = 3
            case .failure(_):
                if self?.retry ?? 0 > 0 {
                    self?.getHomeData()
                }else {
                    debugPrint("Ganpat some error occure in backend side")
                }
            }
        }
    }
}
