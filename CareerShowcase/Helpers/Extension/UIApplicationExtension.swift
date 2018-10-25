

import UIKit

extension UIApplication {
    static var isInTestMode: Bool {
        return ProcessInfo.processInfo.environment["isUITest"] != nil
    }
}
