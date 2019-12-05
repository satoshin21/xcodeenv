import SPMUtility
import Swift
import Basic
import Foundation

func main(_ args: [String]) {

    let parser = ArgumentParser(
        commandName: "xcodeenv",
        usage: "<command> [<args>]",
        overview: "xcode select management tool")

    let local = parser.add(subparser: "local", usage: "[<version name>]", overview: "Set or show the local application-specific Xcode version")
    let versions = parser.add(subparser: "versions", overview: "List all Xcode versions")
    let version = parser.add(subparser: "version", overview: "Show the current Xcode version and its origin")

    do {

        let res = try parser.parse(args)

        guard !args.isEmpty else {
            parser.printUsage(on: stdoutStream)
            exit(0)
        }

        let subparser = res.subparser(local)

        print("subparser res: " + subparser ?? "")



    } catch let e {
        print("error!\(e)")
    }
}

main(Array(CommandLine.arguments.dropFirst()))
