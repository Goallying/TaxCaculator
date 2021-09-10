//
//  Tax.m
//  TaxApp
//
//  Created by admin on 2021/9/10.
//  Copyright © 2021 Lifee. All rights reserved.
//

#import "MonthTax.h"

@implementation MonthTax

+ (instancetype)fetchMonthTaxBy:(NSInteger)month prefore:(MonthTax *)pre{
    return [[self alloc] initWithMonth:month prefore:pre];
}

- (instancetype)initWithMonth:(NSInteger)month prefore:(MonthTax *)pre{
    if (self = [super init]) {
        
        CGFloat preSum = pre ? pre.level.pureIncomeSum : 0 ;
        self.level = [TaxLevel fetchTaxLevelMonth:month prePureIncomeSum:preSum] ;
        self.month = month ;
        self.preTaxSum += (pre.tax + pre.preTaxSum) ;
        self.tax = self.level.pureIncomeSum * self.level.rate - self.level.fastCaculate -  self.preTaxSum;
        
//        NSLog(@"month ==== %zd , presum ==== %f ,preTax ====%f" ,month , pre.preTaxSum , pre.tax);
    }
    return self ;
}

@end
