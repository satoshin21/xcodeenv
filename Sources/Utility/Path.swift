//
//  Path.swift
//  
//
//  Created by Satoshi Nagasaka on 2019/12/12.
//

import Foundation
import Path


private let xcodeDir = ".xcode_versions"
private let xcodeVersion = ".xcode-version"
public extension Path {
    
    static var applications: Path {
        
        return Path.root/"Applications"
    }
    
    static var xcodeDir: Path {
        
        return Path.applications
    }
    
    static var localXcodeVersion: Path {
        return Path.cwd/xcodeVersion
    }
}
