#!/usr/bin/env xcrun swift
import Foundation

func getRemoteIp() {
  let ipURL: NSURL = NSURL(string:"http://www.dyndns.org/cgi-bin/check_ip.cgi")!
  let request: NSURLRequest = NSURLRequest(URL: ipURL)
  let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
  
  do {
    let dataValue: NSData = try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
    let dataString = String(data: dataValue, encoding: NSUTF8StringEncoding)
    if let input = dataString, let ip = parseIP(input) {
      print("My ip is: \(ip)")
    }
    else {
      print("Can't get ip, maybe you are offline?")
    }
  }
  catch _ {
    print("Connection error, can't get ip")
  }
}

func parseIP(input: String) -> String? {
  if let startPosition = input.rangeOfString("Current IP Address: ")?.endIndex {
    let restOfString = input.substringFromIndex(startPosition)
    if let tail = restOfString.rangeOfString("</body></html>")?.startIndex {
      let ip = restOfString.substringToIndex(tail)
      return ip
    }
  }
  
  return nil
}

getRemoteIp()
