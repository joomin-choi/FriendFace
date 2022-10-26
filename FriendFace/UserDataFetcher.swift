//
//  UserDataFetcher.swift
//  FriendFace
//
//  Created by JooMin Choi on 18/10/2022.
//

import Foundation

//class UserDataFetcher: URLSession {
//
//    func fetch() {
//        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
//        let urlRequest = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                let registrationDateFormatter = DateFormatter()
//
//                registrationDateFormatter.dateFormat = "7-MM-dd"
//
//                decoder.dateDecodingStrategy = .formatted(registrationDateFormatter)
//
//                if let decodedUsers = try? decoder.decode([UserServiceResponse].self, from: data) {
//                    DispatchQueue.main.async {
//                        let users = decodedUsers
//                    }
//
//                    return
//                }
//            }
//
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//)

class UserDataFetcher: URLSession {
    
    func fetch() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, URLResponse, error in
            guard let userData = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let users = try decoder.decode([User].self, from: userData)
                return
            } catch {
                print("Decoding failed: \(error)")
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
    }
}
//            if let error = error {
//                completion(.failure(error))
//            } else if let data = data {
//
//                do {
//                    let decoder = JSONDecoder()
//                    decoder.dateDecodingStrategy = .iso8601
//
//                    let userData = try
//                    JSONDecoder().decode(UserServiceResponse.self, from: data)
//                    completion(.success(userData))
//                } catch {
//                    completion(.failure(error))
//                }
//            }
//        }.resume()
//    }
//}
