//
//  TaxCell.h
//  TaxApp
//
//  Created by Lifee on 2019/12/13.
//  Copyright © 2019 Lifee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaxCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *periodlb;
@property (weak, nonatomic) IBOutlet UILabel *taxSumlb;
@property (weak, nonatomic) IBOutlet UILabel *taxlb;
@property (weak, nonatomic) IBOutlet UILabel *taxRatelb;
@property (weak, nonatomic) IBOutlet UILabel *fastCaculatelb;

@end

NS_ASSUME_NONNULL_END
