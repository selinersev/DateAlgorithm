import Foundation

extension Date {
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
}



func x(){
    let dateFirstString = "1990-07-09"
    let dateSecondString = "2000-11-15"
    let dateCompareString = "2019-03-01"
    
    var datesFirstArray = [Date]()
    var datesSecondArray = [Date]()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let dateFirst = dateFormatter.date(from: dateFirstString)!
    let dateSecond = dateFormatter.date(from: dateSecondString)!
    let dateCompare = dateFormatter.date(from: dateCompareString)!
    
    //dateFirst! > dateCompare! ? print("x") : print("y")
    
    let monthsToAdd = 2
    let daysToAdd = 1
    let yearsToAdd = 3
    
    var dateComponent = DateComponents()
    dateComponent.month = monthsToAdd
    dateComponent.day = daysToAdd
    dateComponent.year = yearsToAdd
    

    var dateF = dateFirst
    var dateS = dateSecond
    
    while dateF <= dateCompare {
        print(dateF)
        dateF =  Calendar.current.date(byAdding: dateComponent, to: dateF)!
        datesFirstArray.append(dateF)
    }
    
    print(datesFirstArray)
    
    while dateS <= dateCompare {
        print(dateS)
        dateS =  Calendar.current.date(byAdding: dateComponent, to: dateS)!
        datesSecondArray.append(dateS)
    }

    print(datesSecondArray)
    
    //print(dateFirst)
    //print(dateCompare.days(from: dateFirst))
    
    var daysFirstArr = [Int]()
    var daysSecondArr = [Int]()
    
    for date in datesFirstArray{
        daysFirstArr.append(dateCompare.days(from: date))
    }
    
    //print(dateSecond)
    //print(dateCompare.days(from: dateSecond))
    
    for date in datesSecondArray{
        daysSecondArr.append(dateCompare.days(from: date))
    }
    
    let minFirst = daysFirstArr.min() ?? 0
    let minSecond = daysSecondArr.min() ?? 0
    
    print("First date is \(dateFirstString)")
    print("Second date is \(dateSecondString)")
    print("Compare date is \(dateCompareString)")
    minFirst < minSecond ? print("\(dateCompareString) close to \(dateFirstString)"): print("\(dateCompareString) close to \(dateSecondString)")

}
 x()
