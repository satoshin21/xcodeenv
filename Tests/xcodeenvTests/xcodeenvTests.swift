import XCTest
import class Foundation.Bundle


final class xcodeenvTests: XCTestCase {

    func testExportResult() {
        print("----------------------")
        print(run(arguments: []))
        print("----------------------")
    }

    func testHelp() {
        let withoutArguments = run(arguments: [])
        let helpOption = run(arguments: ["--help"])
        let helpShortOption = run(arguments: ["-h"])

        print("helpShortOption")
        XCTAssertEqual(withoutArguments, helpOption)
    }

    func testLocal() {

        let result = run(arguments: ["local"])
        print("localresult: \(result)")
    }

    func run(arguments: [String]) -> String {

        guard #available(macOS 10.13, *) else {
            return ""
        }

        let binary = productsDirectory.appendingPathComponent("xcodeenv")

        let process = Process()
        process.executableURL = binary
        process.arguments = arguments
        let pipe = Pipe()
        process.standardOutput = pipe
        try? process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8) ?? ""
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testExample", testHelp),
    ]
}
