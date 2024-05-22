//
//  NetworkManager.swift
//  SampleTask
//
//  Created by Ganpat Jangir on 01/05/24.
//

import Foundation

enum APIError: Error{
    case invalidURL
    case requestFailed
    case decodingFailure
}

struct NetworkManager {
    func getDataFromAPI(completion:@escaping(Result<HomePageModel?,APIError>)->Void) {
        let urlString = AppConstants.homePageUrl
        guard let url = URL(string: urlString) else {
            debugPrint("Ganpat API URL is not correct")
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Session": "fb4e7f9b-0f31-4709-",
            "Authorization":"Bearer \(AppConstants.accessToken)"
        ]
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                debugPrint("Ganpat API request failed with error: \(error!.localizedDescription)")
                completion(.failure(.requestFailed))
            }
            if let aData = data {
                do {
                    let result = try JSONDecoder().decode(HomePageModel.self,from: aData)
                    completion(.success(result))
                } catch let error {
                    debugPrint("Ganpat Data Parsing failed with error: \(error.localizedDescription)")
                    completion(.failure(.decodingFailure))
                }
            }else{
                debugPrint("Ganpat data is not available")
                completion(.failure(.requestFailed))
            }
        }.resume()
    }
}
