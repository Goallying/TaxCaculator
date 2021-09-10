//
//  TaxLevel.m
//  TaxApp
//
//  Created by admin on 2021/9/10.
//  Copyright © 2021 Lifee. All rights reserved.
//

#import "TaxLevel.h"

@interface TaxLevel ()
@property (nonatomic ,strong) NSMutableArray <TaxLevel *> * levels ;
@end

@implementation TaxLevel

+ (instancetype)fetchTaxLevelMonth:(NSInteger)month prePureIncomeSum:(CGFloat)prePureIncomeSum{
    return [[self alloc]initLevelWithMonth:month prePureIncomeSum:prePureIncomeSum] ;
}

- (instancetype)initLevelWithMonth:(NSInteger)month prePureIncomeSum:(CGFloat)prePureIncomeSum{
    
   CGFloat pureIncome = (SalaryConfig.salary
                 - SalaryConfig.taxBase
                 - SalaryConfig.special
                 - SalaryConfig.insurance
                 - SalaryConfig.houseFund) * month;
    return [self initWithPureIncomeSum:pureIncome month:month];
}


- (instancetype)initWithPureIncomeSum:(CGFloat)pureIncome month:(NSInteger)month{
    if (self = [super init]) {
        
        if (pureIncome <= 36000.0 ) {
            self.rate = 0.03 ;
            self.fastCaculate = 0  ;
            self.lower = 0 ;
            self.upper = 36000.0 ;
        }else if (pureIncome > 36000.0 && pureIncome <= 144000.0) {
            self.rate = 0.1 ;
            self.fastCaculate = 2520  ;
            self.lower = 36000.0 ;
            self.upper = 144000.0 ;
        }
        else if (pureIncome > 144000.0 && pureIncome <= 300000.0) {
            self.rate = 0.2 ;
            self.fastCaculate = 16920  ;
            self.lower = 144000.0 ;
            self.upper = 300000.0 ;
        }
        else if (pureIncome > 300000.0 && pureIncome <= 420000.0) {
            self.rate = 0.25 ;
            self.fastCaculate = 31920  ;
            self.lower = 300000.0 ;
            self.upper = 420000.0 ;
        }
        else if (pureIncome > 420000.0 && pureIncome <= 660000.0) {
            self.rate = 0.3 ;
            self.fastCaculate = 52920  ;
            self.lower = 420000.0 ;
            self.upper = 660000.0 ;
        }
        else if (pureIncome > 660000.0 && pureIncome <= 960000.0) {
            self.rate = 0.35 ;
            self.fastCaculate = 85920  ;
            self.lower = 660000.0 ;
            self.upper = 960000.0 ;
        }
        else if (pureIncome > 960000.0) {
            self.rate = 0.45 ;
            self.fastCaculate = 181920  ;
            self.lower = 960000.0 ;
            self.upper = CGFLOAT_MAX ;
        }
        self.pureIncomeSum = pureIncome ;
        self.month = month ;
    }
    
    [self.levels addObject:self] ;
    return self ;
}

- (NSMutableArray<TaxLevel *> *)levels {
    if (!_levels) {
        _levels = [NSMutableArray array] ;
    }
    return _levels ;
}
@end
