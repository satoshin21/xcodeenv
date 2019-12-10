//
//  File.swift
//  
//
//  Created by Satoshi Nagasaka on 2019/12/07.
//

import Foundation
import TSCUtility
import Basic
import TSCLibc

public func print(error: Error) {

    let writer = Writer(stream: stderrStream)
    writer.write("error: ", color: .red, bold: true)
    writer.write("\(error.localizedDescription)")
    writer.write("\n")
}

class Writer {

    private let terminalController: TerminalController?
    private let stream: OutputByteStream

    init(stream: OutputByteStream) {
        self.terminalController = TerminalController(stream: stream)
        self.stream = stream
    }

    func write(_ string: String, color: TerminalController.Color = .noColor, bold: Bool = false) {

        if let term = terminalController {
            term.write(string, inColor: color, bold: bold)
        } else {
            stream <<< string
        }
    }

    func flush() {
        stream.flush()
    }
}

