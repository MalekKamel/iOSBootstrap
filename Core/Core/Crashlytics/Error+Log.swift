
import Foundation

public extension Error {
    func logAndReport() {
        print(localizedDescription)
        AppCrashlytics.record(error: self)
    }
}