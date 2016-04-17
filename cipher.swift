#!/usr/bin/env xcrun swift

import Foundation

// Playing with Swift dictionaries

var code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]

func cipherEncode(input: String, withCode code: [String:String]) -> String {
    var output: String = ""
    
    for (character) in input.characters {
        let letter = String(character)
        if let replacementCharacter = code[letter] {
            output += replacementCharacter
        }
        else {
            output += letter
        }
    }
    
    return output
}

var message = "hello, this is simple message!"

let encodeString = cipherEncode(message, withCode: code)
print(encodeString)

func translateCodeForEncoding(code: [String:String]) -> [String:String] {
    var result: [String:String] = [:]
    
    for (key, value) in code {
        result[value] = key
    }
    
    return result
}

let translatedCode = translateCodeForEncoding(code)

let decodeString = cipherEncode(encodeString, withCode: translatedCode)
print(decodeString)
