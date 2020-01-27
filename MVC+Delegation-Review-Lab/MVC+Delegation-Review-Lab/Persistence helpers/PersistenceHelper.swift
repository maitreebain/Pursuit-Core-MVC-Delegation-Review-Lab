//
//  PersistenceHelper.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Maitree Bain on 1/27/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import Foundation

public enum DataPersistenceError: Error {
    case propertyListEncodingError(Error)
    case propertyListDecodingError(Error)
    case writingError(Error)
    case deletingError
    case noContentsAtPath(String)
}

protocol DataPersistenceDelegate: AnyObject {
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T)
    
}
typealias Writable = Codable & Equatable

class DataPersistence<T: Writable> {
    
    private let filename: String
    
    private var items: [T]
    
    weak var delegate: DataPersistenceDelegate?
    
    public init(filename: String) {
        self.filename = filename
        self.items = []
    }
    
    private func saveFont() throws {
        do {
            let url = FileManager.getPath(with: filename, for: .documentsDirectory)
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.writingError(error)
        }
    }
    
    public func loadItems() throws -> [T] {
        let path = FileManager.getPath(with: filename, for: .documentsDirectory).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    items = try PropertyListDecoder().decode([T].self, from: data)
                } catch {
                    throw DataPersistenceError.propertyListDecodingError(error)
                }
            }
        }
        return items
    }
    
    
}
