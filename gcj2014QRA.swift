#!/usr/bin/env swift
import Foundation
func getContens() -> String {
    return NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding) ?? ""
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
    return split(s,{$0==" "}).map({$0.toInt()!})
}
func solve(input: Slice<String>) -> String {
    let an = getInts(input[input[0].toInt()!+0])
    let bn = getInts(input[input[5].toInt()!+5])
    var n = -1
    for a in an {
        for b in bn {
            if a==b {
                if n>=0 { return "Bad magician!" }
                n = a
                break
            }
        }
    }
    if n<0 { return "Volunteer cheated!" }
    return n.description
}
let cs = lines(getContens())
for t in 1...cs[0].toInt()! {
    let input = cs[1+(t-1)*10..<1+t*10]
    println("Case #\(t): \(solve(input))")
}
