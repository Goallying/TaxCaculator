//
//  TaxLevel.h
//  TaxApp
//
//  Created by admin on 2021/9/10.
//  Copyright © 2021 Lifee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SalaryConfig.h"

@interface TaxLevel : NSObject


/// 税率
@property (nonatomic ,assign) CGFloat rate ;


/// 速算扣除数
@property (nonatomic ,assign) CGFloat fastCaculate;


/// 下限
@property (nonatomic ,assign) CGFloat lower ;


/// 上限
@property (nonatomic ,assign) CGFloat upper ;


/// 预扣预缴应纳税所得额
@property (nonatomic ,assign) CGFloat pureIncomeSum ;


/// 月份
@property (nonatomic ,assign) CGFloat month ;

+ (instancetype)fetchTaxLevelMonth:(NSInteger)month prePureIncomeSum:(CGFloat)prePureIncomeSum;

@end
