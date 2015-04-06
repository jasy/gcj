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
func solve(input: String) -> Int {
    let vs = getInts(input)
    let N=vs[0], S=vs[1], p=vs[2], t=vs[3..<3+N]
    let lo = max(0,p-2)*2+p
    let hi = max(0,p-1)*2+p
    var c=0, s=0
    for v in t {
        if v>=hi { ++c }
        else if v>=lo { ++s }
    }
    return c+min(s,S);
}
let cs = lines(getContens())
for t in 1...cs[0].toInt()! {
    println("Case #\(t): \(solve(cs[t]))")
}
