//
//  ViewController.m
//  TaxApp
//
//  Created by Lifee on 2019/12/13.
//  Copyright © 2019 Lifee. All rights reserved.
//

#import "ViewController.h"
#import "TaxCell.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *specialTF;
@property (weak, nonatomic) IBOutlet UITextField *insuranceTF;
@property (weak, nonatomic) IBOutlet UITextField *reserveFundTF;
@property (weak, nonatomic) IBOutlet UITextField *salaryTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)caculate:(UIBarButtonItem *)sender {
    
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 12 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TaxCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.periodlb.text = [NSString stringWithFormat:@"第%ld期",indexPath.row + 1];
    
    
    CGFloat f =  ([self.salaryTF.text floatValue] - 5000 - [self.insuranceTF.text floatValue] - [self.reserveFundTF.text floatValue] - [self.specialTF.text floatValue]) * (indexPath.row + 1 );
    cell.taxSumlb.text = [NSString stringWithFormat:@"累计预扣预缴应纳税所得额:%.1f" ,f];
    cell.taxlb.text = [NSString stringWithFormat:@"交税%.1f" ,[self taxOfMonth:indexPath.row + 1]];

    
    CGFloat fastCaculate = 0 ;
     fastCaculate = 0  ;
    if (f <= 36000.0 ) {
          cell.taxRatelb.text =@"税率:3%";
        fastCaculate = 0  ;
      }else if (f > 36000.0 && f <= 144000.0) {
          cell.taxRatelb.text = @"税率:10%";
          fastCaculate = 2520  ;
      }
       else if (f > 144000.0 && f <= 300000.0) {
           cell.taxRatelb.text = @"税率:20%";
           fastCaculate = 16920  ;
       }
    else if (f > 300000.0 && f <= 420000.0) {
         cell.taxRatelb.text = @"税率:25%";
        fastCaculate = 31920  ;
    }
    else if (f > 420000.0 && f <= 660000.0) {
        cell.taxRatelb.text = @"税率:30%";
          fastCaculate = 52920  ;
    }
    else if (f > 660000.0 && f <= 960000.0) {
        cell.taxRatelb.text = @"税率:35%";
         fastCaculate = 85920  ;
    }
    else if (f > 960000.0) {
         cell.taxRatelb.text = @"税率:45%";
         fastCaculate = 181920  ;
    }
    cell.fastCaculatelb.text = [NSString stringWithFormat:@"速算扣除:%.f" ,fastCaculate];
    return cell ;
}

- (CGFloat)taxOfMonth:(NSInteger)month {
    
    if (month == 0) return  0 ;
    
    CGFloat f =  ([self.salaryTF.text floatValue] - 5000 - [self.insuranceTF.text floatValue] - [self.reserveFundTF.text floatValue] - [self.specialTF.text floatValue]) * month;
    CGFloat rate = 0.03 ;
    CGFloat fastCaculate = 0 ;

    if (f <= 36000.0 ) {
          rate = 0.03 ;
           fastCaculate = 0  ;
      }else if (f > 36000.0 && f <= 144000.0) {
          rate = 0.1 ;
          fastCaculate = 2520  ;
      }
       else if (f > 144000.0 && f <= 300000.0) {
           rate = 0.2 ;
           fastCaculate = 16920  ;
       }
    else if (f > 300000.0 && f <= 420000.0) {
        rate = 0.25 ;
        fastCaculate = 31920  ;
    }
    else if (f > 420000.0 && f <= 660000.0) {
        rate = 0.3 ;
        fastCaculate = 52920  ;
    }
    else if (f > 660000.0 && f <= 960000.0) {
        rate = 0.35 ;
        fastCaculate = 85920  ;
    }
    else if (f > 960000.0) {
        rate = 0.45 ;
        fastCaculate = 181920  ;
    }
    
    CGFloat preTaxSum = 0 ;
    for (NSInteger i = month - 1; i >= 0; i --) {
        
        preTaxSum += [self taxOfMonth:i];
    }
    
    
    return f * rate - fastCaculate  - preTaxSum ;
    
}
@end
