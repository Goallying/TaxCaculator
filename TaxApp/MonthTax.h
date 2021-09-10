//
//  Tax.h
//  TaxApp
//
//  Created by admin on 2021/9/10.
//  Copyright © 2021 Lifee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaxLevel.h"

@interface MonthTax : NSObject


/// 月份
@property (nonatomic ,assign) CGFloat  month ;


/// 本月缴税
@property (nonatomic ,assign) CGFloat  tax ;


/// 税费信息
@property (nonatomic ,strong) TaxLevel  * level ;

/// 该月之前所有月份缴税总额
@property (nonatomic ,assign) CGFloat  preTaxSum ;


+ (instancetype)fetchMonthTaxBy:(NSInteger)month prefore:(MonthTax *)pre;

@end

