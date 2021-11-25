
import Foundation

public func getDocumentsDirectory() -> URL {
     FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
}