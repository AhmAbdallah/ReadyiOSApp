

import Foundation

extension URL {
    private enum Constants {
        static let convertHttpToHttps = true
        static let httpPrefix = "http://"
        static let httpsPrefix = "https://"
    }
    
    static var baseServerURL: URL? {
        guard let baseURL = Bundle.main.infoDictionary?["BaseServerURL"] as? String else { return nil }
        return try? baseURL.asURL()
    }
    
    static func from(modelURL urlString: String?) -> URL? {
        guard let urlString = urlString else { return nil }
        
        if urlString.hasPrefix(Constants.httpsPrefix) {
            return try? urlString.asURL()
        } else if urlString.hasPrefix(Constants.httpPrefix) && Constants.convertHttpToHttps {
            return try? urlString.replacingOccurrences(of: Constants.httpPrefix, with: Constants.httpsPrefix).asURL()
        } else {
            return URL.baseServerURL?.appendingPathComponent(urlString)
        }
    }
}

