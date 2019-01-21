import Foundation

extension Date {
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
}

func parse(date: String) -> (String,String,String){
    let dateArray = date.components(separatedBy: "-")
    return (dateArray[0],dateArray[1],dateArray[2])
}

let compareDate = "2019-07-15"
let firstDate = "1997-07-15"
let secondDate = "2015-01-15"

let firstDateTuple = parse(date: firstDate)
let secondDateTuple = parse(date: secondDate)
let dateToCompareTuple = parse(date: compareDate)

let dateCompare = DateComponents(calendar: .current, year: Int(dateToCompareTuple.0), month: Int(dateToCompareTuple.1), day: Int(dateToCompareTuple.2)).date!

func createDict(startYear: Int, tuple: (String,String,String)) -> [Int : String]{
    var datesDict = [Int : String]()
    for newYear in stride(from: startYear, through: Int(dateToCompareTuple.0) ?? 0, by: 3) {
        datesDict[newYear] = String(newYear) + "-" + tuple.1 + "-" + tuple.2
    }
    return datesDict
}

var datesDictFirst = [Int : String]()
var datesDictSecond = [Int : String]()

datesDictFirst = createDict(startYear: Int(firstDateTuple.0) ?? 0,tuple: firstDateTuple)
datesDictSecond = createDict(startYear: Int(secondDateTuple.0) ?? 0,tuple: secondDateTuple)

func createDaysArray(dictionary: [Int : String]) -> [Int]{
    var daysArray = [Int]()
    for (key,value) in dictionary{
        let date = DateComponents(calendar: .current, year: key, month: Int(parse(date: value).1), day: Int(parse(date: value).2),hour: 8).date!
        daysArray.append(dateCompare.days(from: date))
    }
    return daysArray
}

let minFirst = createDaysArray(dictionary: datesDictFirst).min() ?? 0
let minSecond = createDaysArray(dictionary: datesDictSecond).min() ?? 0

print("First date is \(firstDate)")
print(datesDictFirst)
print("Second date is \(secondDate)")
print(datesDictSecond)
print("Compare date is \(compareDate)")
minFirst < minSecond ? print("\(compareDate) close to \(firstDate)"): print("\(compareDate) close to \(secondDate)")



