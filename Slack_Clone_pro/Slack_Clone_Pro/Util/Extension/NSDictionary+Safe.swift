import Foundation
import UIKit

extension NSDictionary {
    
    //Dictionary에서 해당key가 없을경우, 기본값(def)로 반환
    func objectForKey(key: (Any), def: (Any?)) -> Any? {        
        var ret = def
        if let value = self[key] as Any? {
            ret = value
        }
        return ret
    }
    
    //Dictionary에서 해당key의 string형 값으로 반환하고, 없을경우 기본값(def)을 string형으로 반환
    func stringForKey(key: (Any), def: (String)) -> String {
        var ret = def
        if let value = self[key] as? String {
            ret = value
        } else if let value = self[key] as? NSNumber {
            ret = value.stringValue
        }
		
        return ret
    }
    
    //Dictionary에서 해당key의 int형 값으로 반환하고, 없을경우 기본값(def)을 int형으로 반환
    func intForKey(key: (Any), def: (Int)) -> Int {
        var ret = def
        if let value = self[key] as? NSString {
            ret = Int(value.intValue)
        } else if let value = self[key] as? NSNumber {
            ret = value.intValue
        }
        
        return ret
    }
    
    //Dictionary에서 해당key의 integer형 값으로 반환하고, 없을경우 기본값(def)을 integer형으로 반환
    func integerForKey(key: (Any), def: (NSInteger)) -> NSInteger {
        var ret = def
        if let value = self[key] as? NSString {
            ret = value.integerValue
        } else if let value = self[key] as? NSNumber {
            ret = value.intValue
        }
        
        return ret as NSInteger
    }
    
    //Dictionary에서 해당key의 float형 값으로 반환하고, 없을경우 기본값(def)을 float형으로 반환
    func floatForKey(key: (Any), def: Float) -> Float {
        var ret = def
        if let value = self[key] as? NSString {
            ret = value.floatValue
        } else if let value = self[key] as? NSNumber {
            ret = value.floatValue
        }
        
        return ret
    }
    
    //Dictionary에서 해당key의 double형 값으로 반환하고, 없을경우 기본값(def)을 double형으로 반환
    func doubleForKey(key: (Any), def: (Double)) -> Double {        
        var ret = def
        if let value = self[key] as? NSString {
            ret = value.doubleValue
        } else if let value = self[key] as? NSNumber {
            ret = value.doubleValue
        }
        
        return ret
    }
    
    //Dictionary에서 해당key의 long long형 값으로 반환하고, 없을경우 기본값(def)을 long long형으로 반환
    func longLongForKey(key: (Any), def: (CLongLong)) -> CLongLong {
        var ret = def
        if let value = self[key] as? NSString {
            ret = value.longLongValue
        } else if let value = self[key] as? NSNumber {
            ret = value.int64Value
        }
        
        return ret
    }
    
    //Dictionary에서 해당key의 BOOL형 값으로 반환하고, 없을경우 기본값(def)을 BOOL형으로 반환
    func boolForKey(key: (Any), def: (Bool)) -> Bool {
        var ret = def
        if let value = self[key] as? NSString {
            ret = value.boolValue
        } else if let value = self[key] as? NSNumber {
            ret = value.boolValue
        }
        
        return ret
    }
}
