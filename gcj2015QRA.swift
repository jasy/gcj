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
func solve(input: String) -> Int {
    var c=0, r=0
    for (i,v) in enumerate(split(input){$0==" "}[1]) {
        let a = max(0,i-c)
        c += a + String(v).toInt()!
        r += a
    }
    return r
}
let cs = lines(getContens())
for t in 1...cs[0].toInt()! {
    println("Case #\(t): \(solve(cs[t]))")
}
