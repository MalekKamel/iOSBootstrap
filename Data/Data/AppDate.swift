//
//  AppDate.swift
//  Data
//
//  Created by Shorouk Mohamed on 20/10/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import Foundation

public let appDate = AppDate.shared

public struct DayItem {
    public let name: String
    public let dayOfMonth: Int
    public let date: Date
}

public enum LocaleName: String {
    case enUS = "en_US"
}

public enum Format: String {
    case WeekdayFormat = "eee"
    case dayFormat = "dd"
    case monthFormat = "MM"
    case yearFormat = "yyyy"
    case hourFormat = "h"
    case minuteFormat = "mm"
    case dateFormat = "dd-MM-yyyy"
    case timeFormat = "HH:mm"
    case hourAmPm = "h:mm a" // "hh a"
    case integratingFormat = "dd-MM-yyyy HH:mm"
    case trimmedFormat = "yyyyMMddHHmmss"
    case addonDateFormat = "dd/MM/yyyy  |  HH:mm a"
    case rangeFormat = "E, d MMM"
}

public class AppDate {
    private init() {
    }

    static let shared = AppDate()


    public func days(
            startingFrom startDate: Date,
            byAdding: Calendar.Component,
            value: Int
    ) -> [DayItem] {
        var date = startDate
        let endDate = Calendar.current.date(
                byAdding: byAdding,
                value: value,
                to: date
        )!
        var list = [DayItem]()
        while date < endDate {
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let name = date.format(format: "eee")
            let item = DayItem(
                    name: name,
                    dayOfMonth: day,
                    date: date
            )
            list.append(item)
            date = Calendar.current.date(byAdding: byAdding, value: 1, to: date)!
        }

        return list
    }

    public func getCurrentDay() -> String {
        Date().format(format: Format.dayFormat.rawValue)

    }

    public func getCurrentWeekDay() -> String {
        Date().format(format: Format.WeekdayFormat.rawValue)

    }

    public func getCurrentMonth() -> String {
        Date().format(format: Format.monthFormat.rawValue)
    }

    public func getCurrentYear() -> String {
        Date().format(format: Format.yearFormat.rawValue)

    }

    public func getCurrentHour() -> String {
        Date().format(format: Format.hourFormat.rawValue)

    }

    public func getCurrentMinute() -> String {
        Date().format(format: Format.minuteFormat.rawValue)

    }


    public func getHoursOfDay() -> [String] {
        var hourList = [String]()
        for hour in 1...12 {
            hourList.append(String(hour))
        }
        return hourList
    }

    public func getMinutesOfHour() -> [String] {
        var minutesList = [String]()
        for minute in 0...59 {
            minutesList.append(String(format: "%02d", minute))
        }

        return minutesList
    }

    public func convertStringToDate(str: String, format: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: str)
        return date!
    }

    public func amPm(from date: Date) -> AmPm {
        let amPm = date.format(format: "a").lowercased()
        return amPm == "am" ? .am : .pm
    }
    
    public func convertDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyy, HH:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
       return dateFormatter.string(from: date)
    }
}

public extension Date {
    func format(format: String, locale: LocaleName? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let locale = locale {
            formatter.locale = Locale(identifier: locale.rawValue)
        }
        return formatter.string(from: self)
    }
}

// TODO: separate to a file
public extension TimeInterval {

    static func from(hour: Int) -> TimeInterval {
        Double(hour * 60 * 60)
    }

    static func from(second: Int) -> TimeInterval {
        Double(second * 1000)
    }

    static func from(minute: Int) -> TimeInterval {
        Double(minute * 60 * 1000)
    }

    static func from(day: Int) -> TimeInterval {
        Double(day * 24 * 60 * 60 * 1000)
    }
}

// TODO: separate to a file
public enum AmPm: String {
    case am = "AM"
    case pm = "PM"
}
public extension Date {
     func convertDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyy, HH:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: date)
    }
    func toDateFormat(format: Format) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        let localeID = "en"
        formatter.locale = .some(Locale(identifier: localeID))
        return formatter.string(from: self)
    }
}
