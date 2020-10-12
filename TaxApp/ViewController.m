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

@property (nonatomic ,assign) CGFloat preTaxSum ;
@property (nonatomic ,assign) CGFloat fastCaculate ;
@property (nonatomic ,assign) CGFloat rate ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _preTaxSum = 0.f ;
    
}
- (IBAction)caculate:(UIBarButtonItem *)sender {
    [self.view endEditing:YES];
    _preTaxSum = 0.f ;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54 ;
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
    cell.fastCaculatelb.text = [NSString stringWithFormat:@"速算扣除:%.f" ,_fastCaculate];
    cell.taxRatelb.text = [NSString stringWithFormat:@"税率:%.0f%%",_rate * 100];

    return cell ;
}

- (CGFloat)taxOfMonth:(NSInteger)month {
    
    if (month == 0) return  0 ;
    
    CGFloat f =  ([self.salaryTF.text floatValue] - 5000 - [self.insuranceTF.text floatValue] - [self.reserveFundTF.text floatValue] - [self.specialTF.text floatValue]) * month;
    
    if (f <= 36000.0 ) {
        _rate = 0.03 ;
        _fastCaculate = 0  ;
    }else if (f > 36000.0 && f <= 144000.0) {
        _rate = 0.1 ;
        _fastCaculate = 2520  ;
    }
    else if (f > 144000.0 && f <= 300000.0) {
        _rate = 0.2 ;
        _fastCaculate = 16920  ;
    }
    else if (f > 300000.0 && f <= 420000.0) {
        _rate = 0.25 ;
        _fastCaculate = 31920  ;
    }
    else if (f > 420000.0 && f <= 660000.0) {
        _rate = 0.3 ;
        _fastCaculate = 52920  ;
    }
    else if (f > 660000.0 && f <= 960000.0) {
        _rate = 0.35 ;
        _fastCaculate = 85920  ;
    }
    else if (f > 960000.0) {
        _rate = 0.45 ;
        _fastCaculate = 181920  ;
    }
    
    CGFloat pre =  (f * _rate - _fastCaculate - _preTaxSum);
    _preTaxSum += pre;
    return pre ;
    
//        CGFloat preTaxSum = 0 ;
//        for (NSInteger i = month - 1; i >= 0; i --) {
//
//            preTaxSum += [self taxOfMonth:i];
//        }
//        return f * rate - fastCaculate  - preTaxSum ;
    
}
@end
