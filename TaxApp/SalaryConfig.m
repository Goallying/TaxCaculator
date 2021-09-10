//
//  SalaryConfig.m
//  TaxApp
//
//  Created by admin on 2021/9/10.
//  Copyright © 2021 Lifee. All rights reserved.
//

#import "SalaryConfig.h"

static CGFloat _salary ;
static CGFloat _special ;
static CGFloat _insurance ;
static CGFloat _houseFund ;
static CGFloat _taxBase ;
@implementation SalaryConfig

+ (CGFloat)salary {
    return _salary;
}
+ (void)setSalary:(CGFloat)salary {
    _salary = salary ;
}

+ (void)setSpecial:(CGFloat)special {
    _special = special ;
}
+ (CGFloat)special {
    return _special ;
}

+ (void)setInsurance:(CGFloat)insurance {
    _insurance = insurance ;
}
+ (CGFloat)insurance {
    return _insurance ;
}

+ (void)setHouseFund:(CGFloat)houseFund {
    _houseFund = houseFund ;
}

+ (CGFloat)houseFund {
    return _houseFund ;
}
+ (void)setTaxBase:(CGFloat)taxBase {
    _taxBase = taxBase ;
}
+ (CGFloat)taxBase {
    return _taxBase;
}

@end
