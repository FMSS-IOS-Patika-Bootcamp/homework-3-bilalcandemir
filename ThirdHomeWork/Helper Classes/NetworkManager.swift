//
//  NetworkManager.swift
//  ThirdHomeWork
//
//  Created by Bilal Candemir on 9/18/22.
//

import Foundation

// This class provide to make network calls from different models.
class NetworkManager {
    
    // Make Singleton Design Pattern
    static let shared = NetworkManager()
    
    // Feth Data function get a url for make request, and also get Decodable Model to Decode datas with T (Tuple)
    func fetchData<T: Decodable>(url:String, complation: ((T?, Error?) -> Void)?) {
        guard let url = URL(string: url) else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        // Create a task to make url request and Decode datas which came from API
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            // Check data with guard let and if data is nil turn back
            guard let data = data else {
                complation?(nil, error)
                return
            }
            do {
                // Try to decode data with T.self because this function generic
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                complation?(decodedData, nil)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
