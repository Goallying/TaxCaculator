//
//  ViewController.m
//  TaxApp
//
//  Created by Lifee on 2019/12/13.
//  Copyright © 2019 Lifee. All rights reserved.
//

#import "ViewController.h"
#import "TaxCell.h"
#import "MonthTax.h"

#define TAX_BASE  5000

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *specialTF;
@property (weak, nonatomic) IBOutlet UITextField *insuranceTF;
@property (weak, nonatomic) IBOutlet UITextField *salaryTF;
@property (weak, nonatomic) IBOutlet UITextField *houseFundTF;

@property (nonatomic ,strong) NSMutableArray  <MonthTax *>* lasts;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)caculate:(UIBarButtonItem *)sender {
    [self.view endEditing:YES];
    
    [self.lasts removeAllObjects] ;
    
    SalaryConfig.salary = [self.salaryTF.text floatValue];
    SalaryConfig.special = [self.specialTF.text floatValue] ;
    SalaryConfig.insurance = [self.insuranceTF.text floatValue] ;
    SalaryConfig.houseFund = [self.houseFundTF.text floatValue] ;
    SalaryConfig.taxBase = 5000 ;

    [self dataHandler] ;
    [self.tableView reloadData];
}

- (void)dataHandler{

    NSInteger month = 1 ;
    MonthTax * pre = nil ;
    while (month <= 12) {
        pre = [MonthTax fetchMonthTaxBy:month prefore:pre] ;
        [self.lasts addObject:pre];
        month ++ ;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 156 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.lasts.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TaxCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    MonthTax * monthTax = self.lasts[indexPath.row] ;

    cell.periodlb.text = [NSString stringWithFormat:@"第%ld期",indexPath.row + 1];
    cell.taxSumlb.text = [NSString stringWithFormat:@"累计预扣预缴应纳税所得额:%.1f" ,monthTax.level.pureIncomeSum];
    cell.taxlb.text = [NSString stringWithFormat:@"交税%.1f" ,monthTax.tax];
    cell.fastCaculatelb.text = [NSString stringWithFormat:@"速算扣除:%.f" ,monthTax.level.fastCaculate];
    cell.taxRatelb.text = [NSString stringWithFormat:@"税率:%.2f%%",monthTax.level.rate];
    
    return cell ;
}
- (NSMutableArray<MonthTax *> *)lasts {
    if (!_lasts) {
        _lasts = [NSMutableArray array] ;
    }
    return _lasts ;
}


@end

