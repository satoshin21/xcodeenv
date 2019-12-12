import Swift
import Basic
import Foundation
import SPMUtility
import Utility
import Path
import Command

func main(_ args: [String]) {

    let parser = ArgumentParser(
        commandName: "xcodeenv",
        usage: "<command> [<args>]",
        overview: "xcode select management tool")

    let local = parser.add(subparser: "local", usage: "[<version name>]", overview: "Set or show the local application-specific Xcode version")
    let local_versionName = local.add(positional: "version name", kind: String.self, optional: true, usage: "[<version name>]", completion: ShellCompletion.none)

    let versions = parser.add(subparser: "versions", overview: "List all Xcode versions")
    let version = parser.add(subparser: "version", overview: "Show the current Xcode version and its origin")

    do {

        let res = try parser.parse(args)

        guard !args.isEmpty else {
            parser.printUsage(on: stdoutStream)
            exit(0)
        }

        if try res.get("local") != nil {
            stdoutStream <<< "is_local"
            stdoutStream.flush()
        }
        

        if let localParser = res.subparser(local) {
            print("localparser: \(localParser)")
        }

        if let versionName = res.get(local_versionName) {
            print("versionName: \(versionName)")
        }
        

    } catch let e as ArgumentParserError {

        switch e {
        case .expectedArguments(let parser, let arguments):
            print(error: e)
            parser.printUsage(on: stdoutStream)
        default:
            break
        }

        exit(1)
    } catch let e {

        parser.printUsage(on: stdoutStream)
        exit(1)
    }
}

main(Array(CommandLine.arguments.dropFirst()))
