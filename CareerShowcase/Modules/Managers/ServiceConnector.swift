//
//  ServiceConnector.swift
//  
//
//  Created by Ahmed's Mac on 24/10/18.
//  Copyright © 2018 Ahmed Abdallah. All rights reserved.
//

import Moya
import NVActivityIndicatorView
import SwiftyJSON

enum CareerShowcaseService {
    case getOverview
    
}

class ServiceConnector {

    static let shared = ServiceConnector()
    
    var headers = Dictionary<String, String>()
    
    static var sessionIdCookie : HTTPCookie?
    
    private init() {}
    
    let endpointClosure = { (target: CareerShowcaseService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        return defaultEndpoint.adding(newHTTPHeaderFields: ServiceConnector.shared.headers)
    }
    
    func headers(_ headers: Dictionary<String, String>) -> ServiceConnector {
        for (k, v) in headers {
            ServiceConnector.shared.headers[k] = v
        }
        return .shared
    }
    
    func connect(_ target : CareerShowcaseService) {
        self.connect(target, success: nil)
    }
    
    func connect(_ target : CareerShowcaseService, success: ((_ target : CareerShowcaseService, _ response : JSON) -> ())?) {
        self.connect(target, success: success, error: nil)
    }
    
    func connect(_ target : CareerShowcaseService, success: ((_ target : CareerShowcaseService, _ response : JSON) -> ())?, error: ((_ target: CareerShowcaseService, _ error: MoyaError) -> ())?) {
        let provider = MoyaProvider<CareerShowcaseService>(endpointClosure: endpointClosure)
        print(target.parameters ?? "nil")
        print(target.baseURL)
        print(target.path)
        print(target.parameterEncoding)
        provider.request(target) { result in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            switch result {
            case let .success(moyaResponse):
                
                let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
                
                if statusCode == 403 {
                    // Bad credentials
                }
                var dataString = String(data: moyaResponse.data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                dataString?.stringByRemovingRegexMatches(pattern: "\\s{2,}")
                if let ds = dataString {
                    print("Status Code : ", statusCode)
                    print("Response : ", ds)
                    if let s = success {
                        s(target, JSON(parseJSON: ds))
                    }
                    
                }
                break
            case let .failure(err):
                print("Error : ", err.errorDescription!)
                if let e = error {
                    e(target, err)
                } else {
                    NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                }
                break
            }
        }
    }
}

// MARK: - TargetType Protocol Implementation
extension CareerShowcaseService: TargetType {
    var headers: [String : String]? {
        return ["Authenticate":""]
    }

    static let prtc = "http"
    static let base = ""
    static let port = ""
    
    var baseURL: URL {
        get {
            if !CareerShowcaseService.port.isEmpty {
                return URL(string: "\(CareerShowcaseService.prtc)://\(CareerShowcaseService.base):\(CareerShowcaseService.port)/rest/v1")!
            } else {
                return URL(string: "\(CareerShowcaseService.prtc)://\(CareerShowcaseService.base)")!
            }
        }
    }
    
    var path: String {
        switch self {
        case .getOverview:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getOverview:
            return .get
        default:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getOverview:
            return [:]
        default:
            return nil
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getOverview:
            return URLEncoding.httpBody
        default:
            return JSONEncoding.default
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
}

// MARK: - Helpers
private extension String {
    
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
    
    mutating func stringByRemovingRegexMatches(pattern: String, replaceWith: String = "") {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, self.characters.count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceWith)
        } catch {
            return
        }
    }
    
}
