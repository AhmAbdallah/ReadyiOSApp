//
//    OverviewModel.swift
//
//    Create by Ahmed's Mac on 24/10/2018
//    Copyright © 2018. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON


class OverviewModel : NSObject, NSCoding{
    
    var imageUrl : String!
    var overView : String!
    var overViewId : Int!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        imageUrl = json["imageUrl"].stringValue
        overView = json["overView"].stringValue
        overViewId = json["overView_Id"].intValue
    }
    override init() {
        
    }
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if imageUrl != nil{
            dictionary["imageUrl"] = imageUrl
        }
        if overView != nil{
            dictionary["overView"] = overView
        }
        if overViewId != nil{
            dictionary["overView_Id"] = overViewId
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String
        overView = aDecoder.decodeObject(forKey: "overView") as? String
        overViewId = aDecoder.decodeObject(forKey: "overView_Id") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if imageUrl != nil{
            aCoder.encode(imageUrl, forKey: "imageUrl")
        }
        if overView != nil{
            aCoder.encode(overView, forKey: "overView")
        }
        if overViewId != nil{
            aCoder.encode(overViewId, forKey: "overView_Id")
        }
        
    }

    static func overViewFrom(json: JSON?) -> OverviewModel! {
        var overview = OverviewModel()
        if let j = json {
            let jsonData = j["Data"]
            overview = OverviewModel(fromJson: jsonData)
        }
        return overview 
    }
    
}
