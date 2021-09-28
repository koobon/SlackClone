import Foundation
import UIKit

extension Date {
	
	func isBefore(date: Date) -> Bool {
		return self < date
	}
	
	func isAfter(date: Date) -> Bool {
		return self > date
	}
	
    func isBetweeen(date date1: Date, andDate date2: Date) -> Bool {
        return date1.timeIntervalSince1970 <= self.timeIntervalSince1970 && date2.timeIntervalSince1970 >= self.timeIntervalSince1970
    }
	
	// '연', '월', '일' 로 Date객체 생성
    static func date(year: Int, month: Int, day: Int) -> Date? {
        var components: DateComponents = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        let calendar = Calendar.current
        return calendar.date(from: components)
    }
    
    static func date(year: String, month: String, day: String) -> Date? {
        var components: DateComponents = DateComponents()
        components.year = NSString(string: year).integerValue
        components.month = NSString(string: month).integerValue 
        components.day = NSString(string: day).integerValue
        
        let calendar = Calendar.current
        return calendar.date(from: components)
    }
	
	static func date(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date? {
		var components: DateComponents = DateComponents()
		components.year = year
		components.month = month
		components.day = day
		components.hour = hour
		components.minute = minute
		
		let calendar = Calendar.current
		return calendar.date(from: components)
	}
    
	// 년, 월, 일 > 날짜
	func ymdToDate(year: Int, month: Int, day: Int) -> Date? {
		var components: DateComponents = DateComponents()
		components.year = year
		components.month = month
		components.day = day
		
		let calendar = Calendar.current
		return calendar.date(from: components)
	}

	// 제공받은 날짜의 달의 첫번째 날로 Date객체 생성
	func firstDayDate() -> Date? {
		return Date.date(year: self.year, month: self.month, day: 1)
	}
	
	func getStartDayDate(startDate: Int) -> Date? {
		return Date.date(year: self.year, month: self.month, day: startDate)
	}
	
	// date에 제공받은 '연'수를 더함
	func add(year: Int) -> Date? {
		var components: DateComponents = DateComponents()
		components.year = year
		
		let calendar = Calendar.current
		return calendar.date(byAdding: components, to: self)
	}
	
	// date에 제공받은 '월'수를 더함
	func add(month: Int) -> Date? {
		var components: DateComponents = DateComponents()
		components.month = month
		
		let calendar = Calendar.current
		return calendar.date(byAdding: components, to: self)
	}
	
	// date에 제공받은 '일'수를 더함
	func add(day: Int) -> Date? {
		var components: DateComponents = DateComponents()
		components.day = day
		
		let calendar = Calendar.current
		return calendar.date(byAdding: components, to: self)
	}
	
	//년, 월, 일 만 비교
	func isEqualWithYMD(to date: Date) -> Bool {
		return self.year == date.year && self.month == date.month && self.day == date.day
	}
	
	func isEqualsWithYMDHM(to date: Date) -> Bool {
		return self.year == date.year && self.month == date.month && self.day == date.day &&
			self.hour == date.hour && self.minute == date.minute
	}
	
	// '연'을 반환
	var year: Int {
		get {
			let calendar = Calendar.current
			return calendar.component(.year, from: self)
		}
	}
	
	// '월'을 반환
	var month: Int {
		get {
			let calendar = Calendar.current
			return calendar.component(.month, from: self)
		}
	}
	
	// '일'을 반환
	var day: Int {
		get {
			let calendar = Calendar.current
			return calendar.component(.day, from: self)
		}
	}
	
	// '시'를 반환
	var hour: Int {
		get {
			let calendar = Calendar.current
			return calendar.component(.hour, from: self)
		}
	}
	
	// '분'을 반환
	var minute: Int {
		get {
			let calendar = Calendar.current
			return calendar.component(.minute, from: self)
		}
	}
	
	// '초'를 반환
	var second: Int {
		get {
			let calendar = Calendar.current
			return calendar.component(.second, from: self)
		}
	}
	
	// '요일'을 반환 ( 1 : 일요일, 2 : 월요일, 3 : 화요일, 4 : 수요일, 5 : 목요일, 6 : 금요일, 7 : 토요일 )
	var weekday: Int {
		get {
			let calendar = Calendar.current
			return calendar.component(.weekday, from: self)
		}
	}
    
    var convertDayName: String {
        let weekDay = self.weekday
        switch weekDay {
        case 1:
            return "일요일"
        case 2:
            return "월요일"
        case 3:
            return "화요일"
        case 4:
            return "수요일"
        case 5:
            return "목요일"
        case 6:
            return "금요일"
        case 7:
            return "토요일"
        default:
            return ""
        }
    }
	
	var numberOfDays: Int {
		get {
			let calendar = Calendar.current
			if let days = calendar.ordinality(of: .day, in: .year, for: self) {
				return days + (365 * self.year)
			}
			return -1
		}
	}
	
	var weeks: Int {
		return (self.firstDayDate()!.weekday+self.day-2)/7+1
	}
	
	var getWeeksOfMonth: Int {
		get {
			let calendar = Calendar.current
			return calendar.range(of: .weekOfMonth, in: .month, for: self)!.count
		}
	}
	
	var getDayOfMonth: Int {
		get {
			let calendar = Calendar.current
			return calendar.range(of: .day, in: .month, for: self)!.count
		}
	}
	
	var getYMD: String {
		get {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "yyyy-M-d"
			dateFormatter.calendar = Calendar.current
			return dateFormatter.string(from: self)
		}
	}
	
	// 마지막 '일'을 반환
	var lastday: Int? {
		get {
			let calendar = Calendar.current
			var components = calendar.dateComponents([.year, .month, .day], from: self)
			components.month = (components.month ?? 0) + 1
			components.day = 1
			if let date = calendar.date(from: components),
				let addedDate = date.add(day: -1) {
				return addedDate.day
			}
			return nil
		}
	}
	
	/// Returns the amount of years from another date
	func years(from date: Date) -> Int {
		return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
	}
	/// Returns the amount of months from another date
	func months(from date: Date) -> Int {
		return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
	}
	/// Returns the amount of weeks from another date
	func weeks(from date: Date) -> Int {
		return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
	}
	/// Returns the amount of days from another date
	func days(from date: Date) -> Int {
		return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
	}
	/// Returns the amount of hours from another date
	func hours(from date: Date) -> Int {
		return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
	}
	/// Returns the amount of minutes from another date
	func minutes(from date: Date) -> Int {
		return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
	}
	/// Returns the amount of seconds from another date
	func seconds(from date: Date) -> Int {
		return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
	}
	/// Returns the a custom time interval description from another date
	func offset(from date: Date) -> String {
		if years(from: date)   == 1 { return "\(years(from: date)) year"   } else if years(from: date)   > 1 { return "\(years(from: date)) years"   }
		if months(from: date)  == 1 { return "\(months(from: date)) month"  } else if months(from: date)  > 1 { return "\(months(from: date)) month"  }
		if weeks(from: date)   == 1 { return "\(weeks(from: date)) week"   } else if weeks(from: date)   > 1 { return "\(weeks(from: date)) weeks"   }
		if days(from: date)    == 1 { return "\(days(from: date)) day"    } else if days(from: date)    > 1 { return "\(days(from: date)) days"    }
		if hours(from: date)   == 1 { return "\(hours(from: date)) hour"   } else if hours(from: date)   > 1 { return "\(hours(from: date)) hours"   }
		if minutes(from: date) == 1 { return "\(minutes(from: date)) minute" } else if minutes(from: date) > 1 { return "\(minutes(from: date)) minutes" }
		return ""
	}
}

extension String {
    
    func hmToDate() -> Date? {
        let dateString = "\(Date().year)-\(Date().month)-\(Date().day) \(self)"
        if let date = dateString.toDate(format: "yyyy-MM-dd HH:mm") {
            return date
        }
        if let date = dateString.toDate(format: "yyyy-MM-dd H:mm") {
            return date
        }
        return nil
    }
}
