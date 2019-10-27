//
//  Bundle-WordLoading.swift
//  Switcharoo
//
//  Created by Laurent B on 27/10/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import Foundation

extension Bundle {
    func words(from filename: String) -> Set<String> {
        guard let fileURL = url(forResource: filename, withExtension: nil) else
        {
            fatalError("cant find \(filename)")
        }
        guard let contents = try? String(contentsOf: fileURL) else {
            fatalError()
        }
        return Set(contents.components(separatedBy: "\n"))
    }
}
