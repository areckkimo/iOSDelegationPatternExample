//
//  Utility.swift
//  HelloDelegate
//
//  Created by 陳仕偉 on 2021/1/22.
//

import Foundation

class Utility {
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn;t load \(filename) from main bundle")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }catch{
            fatalError("Couldn't pare \(filename) as \(T.self)")
        }
    }
}
