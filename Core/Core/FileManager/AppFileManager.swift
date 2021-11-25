
import Foundation

public class AppFileManager {

    public enum Error: Swift.Error {
        case fileAlreadyExists
        case fileNotExisted
        case invalidDirectory
        case writingFailed
        case readingFailed
    }

    let fileManager: FileManager

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }

    public func save(fileNamed: String, data: Data) throws {
        guard let url = makeURL(forFileNamed: fileNamed) else {
            throw Error.invalidDirectory
        }
        if fileManager.fileExists(atPath: url.path) {
            throw Error.fileAlreadyExists
        }
        do {
            try data.write(to: url)
        } catch {
            debugPrint(error)
            error.logAndReport()
            throw Error.writingFailed
        }
    }

    private func makeURL(forFileNamed fileName: String) -> URL? {
         getDocumentsDirectory().appendingPathComponent(fileName)
    }

    public func read(fileNamed: String) throws -> Data {
        guard let url = makeURL(forFileNamed: fileNamed) else {
            throw Error.invalidDirectory
        }
        return try read(url: url)
    }

    public func read(url: URL) throws -> Data {
        guard fileManager.fileExists(atPath: url.path) else {
            throw Error.fileNotExisted
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            debugPrint(error)
            error.logAndReport()
            throw Error.readingFailed
        }
    }

}
