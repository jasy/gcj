#!/usr/bin/env swift
import Foundation
func getContens() -> String {
    return NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)! as String
}
func strip(s: String, charset: NSCharacterSet) -> String {
    return s.stringByTrimmingCharactersInSet(charset)
}
func strip(s: String) -> String {
    return strip(s,NSCharacterSet.whitespaceAndNewlineCharacterSet())
}
func lines(s: String) -> [String] {
    return strip(s,NSCharacterSet.newlineCharacterSet()).componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
}
func getInts(s: String) -> [Int] {
    return split(s){$0==" "}.map({$0.toInt()!})
}
func solve(input: ArraySlice<String>) -> String {
    let an = getInts(input[input[0].toInt()!+0])
    let bn = getInts(input[input[5].toInt()!+5])
    let s = Set(an).intersect(bn)
    switch s.count {
        case 0: return "Volunteer cheated!"
        case 1: return Array(s)[0].description
        default: return "Bad magician!"
    }
}
let cs = lines(getContens())
for t in 1...cs[0].toInt()! {
    let input = cs[1+(t-1)*10..<1+t*10]
    println("Case #\(t): \(solve(input))")
}
