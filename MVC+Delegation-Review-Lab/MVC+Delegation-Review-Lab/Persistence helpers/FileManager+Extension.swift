//
//  FileManager+Extension.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Maitree Bain on 1/27/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import Foundation

public enum Directory {
    case documentsDirectory
    case cachesDirectory
}

extension FileManager {
    public static func getDocumentsDirectory() -> URL  {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    public static func getCachesDirectory() -> URL  {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    }
    
    public static func getPath(with filename: String, for directory: Directory) -> URL {
        switch directory {
        case .cachesDirectory:
            return getCachesDirectory().appendingPathComponent(filename)
        case .documentsDirectory:
            return getDocumentsDirectory().appendingPathComponent(filename)
        }
    }
}
