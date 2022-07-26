import Foundation
import RegexBuilder

private var transactions: [String] = [
    "DEBIT      03/05/2022   DBS Salary      $1000.00",
    "CREDIT     07/05/2022   Starbucks       $12.00",
    "CREDIT     08/05/2022   McDonald's      $23.00",
    "DEBIT      13/05/2022   Cash Deposit    $150.00",
    "CREDIT     18/05/2022   KFC             $15.00",
    "DEBIT      29/05/2022   Coin Deposit    $1.99",
]

// EXAMPLE 1
let regexString = #"\s{2,}|\t"#
let regex = try Regex(regexString)
for transaction in transactions {
    let match = transaction.split(separator: regex)
//    print(match)
}

// EXAMPLE 2
let regexSubstring = /\s{2,}|\t/
for transaction in transactions {
    let match = transaction.split(separator: regexSubstring)
//    print(match)
}

// EXAMPLE 3
for transaction in transactions {
    var transaction2 = transaction
    transaction2.replace(regexSubstring, with: "|")

    let regexSubstring2 = /[|]/
    let match = transaction2.split(separator: regexSubstring2)
    print(match)
}

//EXAMPLE 4
let fieldSeparator = /\s{2,}|\t/
let locale = Locale(identifier: "en_SG")
let currency = locale.currency

guard let currency else { fatalError() }

let regex2 = Regex {
    Capture { /CREDIT|DEBIT/ }
    fieldSeparator

    Capture { One(.date(.numeric, locale: locale, timeZone: .current)) }
    fieldSeparator

    Capture {
        OneOrMore {
            NegativeLookahead { fieldSeparator }
            CharacterClass.any
        }
    }

    Capture { One(.localizedCurrency(code: currency, locale: locale)) }
}

for transaction in transactions {
    if let match = transaction.wholeMatch(of: regex2) {
        checkTypedValues(date: match.2, amount: match.4)
    }
}

private func checkTypedValues(date: Date, amount: Decimal) {
    print("\(date) \(amount)")
}

//EXAMPLE 5
let line = "Ivan Mah <ivanmahjx@dbs.com>     # Initial commit. "
let regexSubstring2 = /\h*([^<#]+?)??\h*<([^>#]+)>\h*(?:#|\Z)/
let regex3 = Regex(regexSubstring2)
let match = line.prefixMatch(of: regex3)
print(line[match![1].range!])
print(line[match![2].range!])
