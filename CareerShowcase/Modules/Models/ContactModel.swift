//
//	ContactModel.swift
//
//	Create by Ahmed's Mac on 26/10/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class ContactModel : NSObject, NSCoding{

	var descriptionField : String!
	var id : Int!
	var name : String!
	var period : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		descriptionField = json["description"].stringValue
		id = json["id"].intValue
		name = json["name"].stringValue
		period = json["period"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if period != nil{
			dictionary["period"] = period
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         period = aDecoder.decodeObject(forKey: "period") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if period != nil{
			aCoder.encode(period, forKey: "period")
		}

	}
    static func contactFrom(json: JSON?) -> [ContactModel]! {
        var Contacts = [ContactModel]()
        if let j = json {
            let jsonArray = j["data"].arrayValue
            for contact in jsonArray {
                Contacts.append(ContactModel(fromJson: contact))
            }
        }
        return Contacts
    }

}
