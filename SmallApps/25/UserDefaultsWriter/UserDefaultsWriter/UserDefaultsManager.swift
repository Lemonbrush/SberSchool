//
//  UserDefaultsManager.swift
//  UserDefaultsWriter
//
//  Created by Alexander Rubtsov on 11.08.2021.
//

import Foundation

class UserDefaultsManager <T:Codable> {
    
    static func set(object: T , forKey key: String) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(object) {
            UserDefaults.standard.setValue(data, forKey: key)
            print("DONE")
        }
    }
    
    static func getObkect(forKey key: String) -> T? {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        
        if let decodedData = try? decoder.decode(T.self, from: data) {
            return decodedData
        }
        
        return nil
    }
}
