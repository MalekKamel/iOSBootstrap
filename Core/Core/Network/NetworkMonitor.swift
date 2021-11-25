
import Foundation
import Network

public class NetworkMonitor {
    private let monitor: NWPathMonitor! = NWPathMonitor()

    init() {
        observe()
        start()
    }

    func observe() {
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
            } else {
                print("There's no internet connection.")
            }
        }
    }

    func start() {
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.start(queue: queue)
    }

}
