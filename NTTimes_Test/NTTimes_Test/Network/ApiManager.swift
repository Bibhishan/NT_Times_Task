//
//  ApiManager.swift
//  NTTimes_Test
//
//  Created by Bibhishan Biradar on 14/07/23.
//

import Foundation

protocol PostAPIRequestProtocol {
    func getAPIData(endPoints: String, completion: @escaping (Result<PostModel?, ServerError>) -> Void)
}

class ApiManager: PostAPIRequestProtocol
{
    private let session : URLSession
    
    init (session : URLSession = URLSession.shared){
        self.session = session
    }
    
    func getAPIData<T: Decodable>(endPoints: String, completion: @escaping (Result<T?, ServerError>) -> Void) where T: Codable {
        guard let url = URL(string: APIEnvironment.development.baseURL + endPoints) else {
            return
        }
        let task = self.session.dataTask(with: url) { (data , response ,error) in
            guard error == nil else {
                completion (.failure(.unknownError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                completion(.failure(.unknownError))
                return
            }
            
            guard 200..<300 ~= response.statusCode else {
                completion(.failure(.init(code: response.statusCode)))
                return
            }
            
            do{
                guard let data = data else{
                    completion(.failure(.unknownError))
                    return
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let value = try decoder.decode(T.self, from: data)
                completion(.success(value))
            } catch{
                completion(.failure(.customError("Decoding Error")))
            }
        }
        task.resume()
    }
}
