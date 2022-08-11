//
//  ObjCDocCFile.m
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 2/8/22.
//

#import <Foundation/Foundation.h>

#import "BankAccount.h"

static int openAccounts = 0;

/// Bank Account
@implementation BankAccount

/// Create new instance of bank account
//+(BankAccount *) newAlloc
//{
//    openAccounts++;
//
//    return [BankAccount alloc];
//}

/// Closure of bank account
+ (Boolean) closeAccount
{
    openAccounts--;
    return true;
}

/// Get the total of bank account opened
-(int) totalOpen
{
    
    return openAccounts;
}
@end
