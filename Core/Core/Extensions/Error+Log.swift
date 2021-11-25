
import Foundation

public extension Error {
    func logAndReport() {
        print(localizedDescription)
        CrashlyticsUtil.record(error: self)
    }
}