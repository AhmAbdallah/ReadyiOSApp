//
//  StringExtension.swift
//  4A5
//
//  Created by Ahmed Abdallah on 1/27/18.
//  Copyright © 2018 Ahmed Abdallah. All rights reserved.
//


import UIKit

extension String {
    /// match this string with regex pattern
    ///
    /// - Parameter regex: regex pattern
    /// - Returns: bool value indicate if it match or not
    func matchRegex(regex : String ) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    /// cheack if this string is availd url or not
    ///
    /// - Returns:  Returns: bool value indicate if it url or not
    func isValidURL() -> Bool {
        let regex : String = "^(http|https|ftp)\\://([a-zA-Z0-9\\.\\-]+(\\:[a-zA-Z0-9\\.&amp;%\\$\\-]+)*@)*((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|localhost|([a-zA-Z0-9\\-]+\\.)*[a-zA-Z0-9\\-]+\\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(\\:[0-9]+)*(/($|[a-zA-Z0-9\\.\\,\\?\\'\\\\\\+&amp;%\\$#\\=~_\\-]+))*$"
        return self.matchRegex(regex: regex)
    }
    
    /// cheack if this string is availd UUID or not
    ///     case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    //case password = "^.{6,15}$" // Password length 6-15
   // case alphabeticStringWithSpace = "^[a-zA-Z ]*$" // e.g. hello sandeep
   // case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$" // SandsHell
   // case phoneNo = "[0-9]{10,14}" // PhoneNo 10-14 Digits        //Change RegEx according to your Requirement

    /// - Returns:  Returns: bool value indicate if it UUID or not
    func validateEmail() -> Bool {
        let regex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        
        return self.matchRegex(regex: regex)
    }
    func isValidpassword() -> Bool {
        let regex : String = "^.{6,15}$"
        return self.matchRegex(regex: regex)
    }
    func isValidConfirm(password:String) -> Bool {
        let regex : String = "^.{6,15}$"
        return self.matchRegex(regex: regex) && (self == password)
    }
    func isValidalphabeticStringWithOutSpace() -> Bool {
        let regex : String = "^[a-zA-Z]*$"
        return self.matchRegex(regex: regex)
    }
    func isValidPhoneNo() -> Bool {
        let regex : String = "[0-9]{10,14}"
        return self.matchRegex(regex: regex)
    }
    
    func isValidUUID() -> Bool {
        let regex : String = "[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}"
        return self.matchRegex(regex: regex)
    }
    //
    static func randomUUID() -> String {
     return UUID().uuidString
    }
}
extension Date {
    
    func toString() -> String {
        let format = "EEE, d MMM yyyy"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let myString = formatter.string(from: self)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = format
        
        return formatter.string(from: yourDate!)
    }
}
