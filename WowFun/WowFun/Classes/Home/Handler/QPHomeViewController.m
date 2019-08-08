//
//  QPHomeViewController.m
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPHomeViewController.h"
#import "QPHTTPClient.h"
#import "QPAPIConfig.h"
#import "NSString+TimeFormat.h"
#import <MJRefresh/MJRefresh.h>
#import <Masonry/Masonry.h>

@interface QPHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSArray * dataList;

@end

@implementation QPHomeViewController

- (UITableView *)tableView {
 
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        
        _tableView.mj_header.ignoredScrollViewContentInsetTop = -44;
        _tableView.mj_header.automaticallyChangeAlpha = YES;
        _tableView.mj_footer.automaticallyChangeAlpha = YES;
    }
    return _tableView;
}

- (NSArray *)dataList {
    
    if (!_dataList) {
        
        _dataList = [NSArray array];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    [self loadData];
}

- (void)initUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}

- (void)loadData {
    
    [[QPHTTPClient sharedClient] requestWithPath:API_SNIPPET_LIST method:HTTPRequestGet params:nil prepare:^{
        
//        NSLog(@"prepare");
        
        self.tableView.mj_header.ignoredScrollViewContentInsetTop = 0;
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
       
//        NSLog(@"success\n%@", responseObject);
        
        self.dataList = [responseObject objectForKey:@"results"];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer resetNoMoreData];

    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
//        NSLog(@"error\n%@", error);
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)loadMoreData {
 
     [self.tableView.mj_footer resetNoMoreData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    NSDictionary * dict = self.dataList[indexPath.row];
    NSString * responseTime = [dict valueForKey:@"created"];
    NSString * dateTimeStr = [responseTime dateTimeStringFromResponseTime];
    
    cell.textLabel.text = [dict valueForKey:@"code"];
    cell.detailTextLabel.text = dateTimeStr; // [dateTimeStr timeIntervalStringFromTime];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary * dict = self.dataList[indexPath.row];
    
    NSLog(@"%@", dict);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
