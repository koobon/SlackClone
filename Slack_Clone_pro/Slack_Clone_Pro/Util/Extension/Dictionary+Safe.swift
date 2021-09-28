import Foundation
import UIKit

extension Dictionary where Key == String, Value == Any {
	
	func string(key: (String), def: (String?)) -> String {
		var ref = def ?? ""
		if let value = self[key] as? String {
			ref = value
		} else if let value = self[key] as? NSNumber {
			ref = value.stringValue as String
		}
		
		return ref
	}
    
    func date(key: (String), def: (Date?) = Date()) -> Date {
        var ret = def ?? Date()
        if let value = self[key] as? Date {
            ret = value
        }
        
        return ret
    }
	
	func int(key: (String), def: (Int?)) -> Int {
		var ret = def ?? 0
		if let value = self[key] as? String {
			ret = Int(NSString(string: value).integerValue)
		} else if let value = self[key] as? NSNumber {
			ret = value.intValue
		}
		
		return ret
	}
	
	func double(key: (String), def: (Double?)) -> Double {
		var ret = def ?? 0.0
		if let value = self[key] as? String {
			ret = NSString(string: value).doubleValue
		} else if let value = self[key] as? NSNumber {
			ret = value.doubleValue
		}
		
		return ret
	}
	
	func bool(key: (String), def: (Bool?)) -> Bool {
		var ret = def ?? false
		if let value = self[key] as? String {
			ret = NSString(string: value).boolValue
		} else if let value = self[key] as? NSNumber {
			ret = value.boolValue
		}
		
		return ret
	}
	
	func object(key: (String), def: Any? = nil) -> Any? {
		var ret = def ?? nil
		if let value = self[key] {
			ret = value
		}
		return ret
	}
}
