//
//  FontManager.swift
//  MyFatoorah
//
//  Created by Ahmed Abdallah on 3/8/17.
//  Copyright © 2017 Ahmed Abdallah. All rights reserved.
//

import UIKit


enum FontManager:String {
    case APPRegular
    case APPMedium
    case APPSemiBold
    case APPLight
    
   private var fontName:String {
        return Language.isRTL ? self.arabicFontName :self.englishFontName
    }
    /*
     family: Avenir Next Condensed
     name: AvenirNextCondensed-Heavy
     name: AvenirNextCondensed-MediumItalic
     name: AvenirNextCondensed-Regular
     name: AvenirNextCondensed-UltraLightItalic
     name: AvenirNextCondensed-Medium
     name: AvenirNextCondensed-HeavyItalic
     name: AvenirNextCondensed-DemiBoldItalic
     name: AvenirNextCondensed-Bold
     name: AvenirNextCondensed-DemiBold
     name: AvenirNextCondensed-BoldItalic
     name: AvenirNextCondensed-Italic
     name: AvenirNextCondensed-UltraLight
     family: Avenir LT Std
     name: AvenirLTStd-Heavy
     name: AvenirLTStd-Medium
     name: AvenirLTStd-Roman
     name: AvenirLTStd-Book
     name: AvenirLTStd-Light
     name: AvenirLTStd-Black
     family: Avenir
     name: Avenir-Oblique
     name: Avenir-HeavyOblique
     name: Avenir-Heavy
     name: Avenir-BlackOblique
     name: Avenir-BookOblique
     name: Avenir-Roman
     name: Avenir-Medium
     name: Avenir-Black
     name: Avenir-Light
     name: Avenir-MediumOblique
     name: Avenir-Book
     name: Avenir-LightOblique
     family: Avenir Next
     name: AvenirNext-Medium
     name: AvenirNext-DemiBoldItalic
     name: AvenirNext-DemiBold
     name: AvenirNext-HeavyItalic
     name: AvenirNext-Regular
     name: AvenirNext-Italic
     name: AvenirNext-MediumItalic
     name: AvenirNext-UltraLightItalic
     name: AvenirNext-BoldItalic
     name: AvenirNext-Heavy
     name: AvenirNext-Bold
     name: AvenirNext-UltraLight
 */
    private var englishFontName:String {
        switch self {
            case .APPRegular: return "AvenirNext-Regular"
            case .APPMedium: return "Avenir-Medium"
            case .APPLight: return "Avenir-Light"
            case .APPSemiBold: return "AvenirLTStd-Heavy"
        }
    }
    
    private var arabicFontName:String {
        switch self {
        case .APPRegular: return "AvenirNext-Regular"
        case .APPMedium: return "Avenir-Medium"
        case .APPLight: return "Avenir-Light"
        case .APPSemiBold: return "AvenirLTStd-Heavy"
        }
    }
    
   public func fontWith(size: CGFloat) -> UIFont {
    let font = UIFont(name:self.fontName,size:size)
        return font!
    }
    public func fontWith(englishFontName:String,  size: CGFloat) -> UIFont {
        switch englishFontName {
        case FontManager.APPRegular.englishFontName:  return FontManager.APPRegular.fontWith(size: size)
        case FontManager.APPMedium.englishFontName:  return FontManager.APPMedium.fontWith(size: size)
        case FontManager.APPLight.englishFontName:  return FontManager.APPLight.fontWith(size: size)
        case FontManager.APPSemiBold.englishFontName:  return FontManager.APPSemiBold.fontWith(size: size)
        default: return  FontManager.APPRegular.fontWith(size: size)
        }
        
    }
}


