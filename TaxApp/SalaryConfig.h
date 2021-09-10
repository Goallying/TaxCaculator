//
//  SalaryConfig.h
//  TaxApp
//
//  Created by admin on 2021/9/10.
//  Copyright © 2021 Lifee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalaryConfig : NSObject


/// 薪资
@property (nonatomic ,assign ,class) CGFloat  salary ;

/// 缴税基数
@property (nonatomic ,assign ,class) CGFloat  taxBase ;


/// 专项附加扣除
@property (nonatomic ,assign ,class) CGFloat  special ;


/// 公积金
@property (nonatomic ,assign ,class) CGFloat  houseFund ;


/// 五险
@property (nonatomic ,assign ,class) CGFloat  insurance ;


@end

