//
//  File.swift
//  
//
//  Created by Satoshi Nagasaka on 2019/12/06.
//

import Foundation
import TSCUtility

extension Version: ArgumentKind {

    public init(argument: String) throws {
        guard let version = Version(string: argument) else {
            throw ArgumentConversionError.typeMismatch(value: argument, expectedType: Version.self)
        }

        self = version
    }

    public static var completion: ShellCompletion {
        return ShellCompletion.none
    }
}
