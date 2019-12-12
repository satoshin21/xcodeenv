//
//  open.swift
//  
//
//  Created by Satoshi Nagasaka on 2019/12/06.
//

import Foundation
import Path
import Utility

public func open() throws {
    
    let localXcodeVersion = Path.localXcodeVersion
    
    let version = localXcodeVersion.exists ? try String(contentsOf: localXcodeVersion) : "11.0.2"
}
