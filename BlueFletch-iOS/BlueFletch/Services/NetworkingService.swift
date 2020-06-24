//
//  NetworkingService.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Networking: AnyObject {}

class NetworkingService {
    private let host = "http://localhost:8080"
}

extension NetworkingService: HomeApi {
    func fetchOffering(completion: @escaping (Result<[OfferingModel], Error>) -> ()) {
        let urlString = host + "/offerings"
        guard let url = URL(string: urlString) else { return }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                    //handle http response
                default: break;
                }
            }
            
            if let data = data {
                do {
                    let offerings = try JSONDecoder().decode([OfferingModel].self, from: data)
                    completion(.success(offerings))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
        
    }
}

protocol HomeApi: Networking {
    func fetchOffering(completion: @escaping (Result<[OfferingModel], Error>) -> ())
}
