//
//  Localizer.swift
//  Localization102
//
//  Created by Ahmed Abdallah on 2/24/16.
//  Copyright © 2016 Ahmed Abdallah. All rights reserved.
//

import Foundation
import UIKit

import ObjectiveC

extension UIApplication {
    class func isRTL() -> Bool{
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }
}

class Localizer: NSObject {
    class func DoTheMagic() {
        
        MethodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.specialLocalizedStringForKey(_:value:table:)))
        
        MethodSwizzleGivenClassName(cls: UIApplication.self, originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection), overrideSelector: #selector(getter: UIApplication.cstm_userInterfaceLayoutDirection))
        
        
        MethodSwizzleGivenClassName(cls: UITextField.self, originalSelector: #selector(UITextField.layoutSubviews), overrideSelector: #selector(UITextField.cstmlayoutSubviews))
        MethodSwizzleGivenClassName(cls: UILabel.self, originalSelector: #selector(UILabel.layoutSubviews), overrideSelector: #selector(UILabel.cstmlayoutSubviews))
        
        MethodSwizzleGivenClassName(cls: UIButton.self, originalSelector: #selector(UIButton.layoutSubviews), overrideSelector: #selector(UIButton.cstmlayoutSubviews))
        
        
        //   MethodSwizzleGivenClassName(cls: UIButton.self, originalSelector: #selector(UIButton.setImage), overrideSelector: #selector(UIButton.cstmsetImage))
        
        
    }
    
    class func switchTheLanguage(lan :String)   {
        if (lan == Language.currentAppleLanguage())
        {
           return
        }
        if lan == "ar" {
            Language.setAppleLAnguageTo(lang: "ar")
            if #available(iOS 9.0, *) {
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                
            } else {
                // Fallback on earlier versions
            }
        } else {
            Language.setAppleLAnguageTo(lang: "en")
            if #available(iOS 9.0, *) {
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
            } else {
                // Fallback on earlier versions
            }
        }
        
        
        
        
        //app.changeLang();
    }
}




var numberoftimes = 0
extension UIApplication {
    @objc var cstm_userInterfaceLayoutDirection : UIUserInterfaceLayoutDirection {
        get {
            var direction = UIUserInterfaceLayoutDirection.leftToRight
            if Language.currentAppleLanguage() == "ar" {
                direction = .rightToLeft
            }
            return direction
        }
    }
}
extension Bundle {
    @objc func specialLocalizedStringForKey(_ key: String, value: String?, table tableName: String?) -> String {
        if self == Bundle.main {
            let currentLanguage = Language.currentAppleLanguage()
            var bundle = Bundle();
            if let _path = Bundle.main.path(forResource: Language.currentAppleLanguageFull(), ofType: "lproj") {
                bundle = Bundle(path: _path)!
            }else
                if let _path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
                    bundle = Bundle(path: _path)!
                } else {
                    let _path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
                    bundle = Bundle(path: _path)!
            }
            return (bundle.specialLocalizedStringForKey(key, value: value, table: tableName))
        } else {
            return (self.specialLocalizedStringForKey(key, value: value, table: tableName))
        }
    }
}
func disableMethodSwizzling() {
    
}


/// Exchange the implementation of two methods of the same Class
func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    let origMethod: Method = class_getInstanceMethod(cls, originalSelector)!;
    let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector)!;
    if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, overrideMethod);
    }
}

private var setBeforLoc: Bool = false
extension UILabel {
    var setBefor: Bool {
        get {
            return (objc_getAssociatedObject(self, &setBeforLoc) != nil)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &setBeforLoc, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        
                    if UIApplication.isRTL()  {
                        if self.tag >=  0  && self.textAlignment != .center {
                            self.textAlignment = .right
                        }
                        else if self.tag < 0 {
                            self.textAlignment = .left
                        }
                        
                        
                    } else {
                        
                        if self.tag >=  0 && self.textAlignment != .center  {
                            self.textAlignment = .left
                        }
                        else if self.tag < 0 {
                            self.textAlignment = .right
                        }
                        
                    }
        
    }
}




extension UIButton {
    var setBefor: Bool {
        get {
            return (objc_getAssociatedObject(self, &setBeforLoc) != nil)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &setBeforLoc, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    func loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: [UIView]) {
        if subviews.count > 0 {
            for subView in subviews {
                if (subView is UIImageView) && subView.tag < 0 {
                    let toRightArrow = subView as! UIImageView
                    if let _img = toRightArrow.image {
                        toRightArrow.image = UIImage(cgImage: _img.cgImage!, scale:_img.scale , orientation: UIImageOrientation.upMirrored)
                    }
                }
                loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: subView.subviews)
            }
        }
    }
    
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        
        
        if UIApplication.isRTL()  {
            if self.tag >=  0  && self.contentHorizontalAlignment != .center {
                
                self.contentHorizontalAlignment = .right
            }
            else if self.tag < 0 {
                self.contentHorizontalAlignment = .left
            }
            
            
        } else {
            
            if self.tag >=  0 && self.contentHorizontalAlignment != .center  {
                self.contentHorizontalAlignment = .left
            }
            else if self.tag < 0 {
                self.contentHorizontalAlignment = .right
            }
            
        }
        
    }
}

extension UITextField
{
    var setBefor: Bool {
        get {
            return (objc_getAssociatedObject(self, &setBeforLoc) != nil)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &setBeforLoc, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        
        if UIApplication.isRTL()  {
            if self.tag >=  0  && self.textAlignment != .center {
                self.textAlignment = .right
            }
            else if self.tag < 0 {
                self.textAlignment = .left
            }
            
            
        } else {
            
            if self.tag >=  0 && self.textAlignment != .center  {
                self.textAlignment = .left
            }
            else if self.tag < 0 {
                self.textAlignment = .right
            }
            
        }
        
    }
}

public extension String {
    func localized() -> String {
        if let path = Bundle.main.path(forResource: Language.currentAppleLanguage(), ofType: "lproj"), let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        }
        return self
    }
    func localizedFormat(arguments: CVarArg...) -> String {
        return String(format: localized(), arguments: arguments)
    }
 
    func localizedPlural(argument: CVarArg) -> String {
        return NSString.localizedStringWithFormat(localized() as NSString, argument) as String
    }
}
