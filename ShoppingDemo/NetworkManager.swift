//
//  NetworkManager.swift
//  ShoppingDemo
//
//  Created by Nikk Bhateja on 31/03/24.
//

import Foundation

// Network error enum
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}

// final: You can't inherit this class to any other class.
final class NetworkManager {
    
/*
    1. Created a generic function that can handle data for each model(Re-use ability).
 
    2. async: means the method we declare is of asyncronous in behaviour.
    
    3. thorws: means we can't implement try catch block in this method instead we are going to use try catch block where we will call this method in whole project.
    
    4. If we are getting any exception then our method is going to throw the error and If we are getting response then it will return the whole response.
*/
    
    
    func requestForAPIData<T: Decodable>(_ url: String) async throws -> T {
        guard let finalURL = URL(string: url) else {
            // URL invalid error throw here.
            throw NetworkError.invalidURL
//            return
        }
        
        // I created a tuple to manage error and response in single variable because dataTask itself is returning us the data and response.
        let (data, response) = try await URLSession.shared.data(from: finalURL)
        
        // Now, We want HTTPURLResponse because the above mentioned response does not contain any statusCode and we want to use status code we have to type cast our response to HTTPURLResponse.
        // then we check for the statusCode.
        guard (response as? HTTPURLResponse)?.statusCode == 200  else {
            // throw invalid response error
            throw NetworkError.invalidResponse
//            return
        }
        
        // Return the final response.
        let finalResponse = try JSONDecoder().decode(T.self, from: data)
        return finalResponse
        
        // OR we can simply return as
        // return try JSONDecoder().decode(T.self, from: data)
    }
    
}
