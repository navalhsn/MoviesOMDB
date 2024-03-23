//
//  NetworkService.swift
//  Movies
//
//  Created by Naval Hasan on 23/03/24.
//

import Foundation

class NetworkService {
    func fetchApiData<T:Decodable>(endPoint: API, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void) {
        let urlRequest = URLRequest(url: endPoint.url)
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(data != nil && data?.count != 0) {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
}
