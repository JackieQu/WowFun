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

#import "QPJoke.h"
#import "QPJokeCell.h"
#import "QPJokeFrame.h"

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
        
        _tableView.mj_header.automaticallyChangeAlpha = YES;
        _tableView.mj_footer.automaticallyChangeAlpha = YES;
        
        [_tableView registerClass:[QPJokeCell class] forCellReuseIdentifier:@"cellID"];
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
    
//    [[QPHTTPClient sharedClient] requestWithPath:API_SNIPPET_LIST method:HTTPRequestGet params:nil prepare:^{
//
////        NSLog(@"prepare");
//
//        self.tableView.mj_header.ignoredScrollViewContentInsetTop = 0;
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//
////        NSLog(@"success\n%@", responseObject);
//
//        self.dataList = [responseObject objectForKey:@"results"];
    
        /* 测试数据 */
        NSDictionary * jokeDick = @{@"nickname"      : @"我趣大橙子",
                                    @"avatar"        : @"profile",
                                    @"pk"            : @(10),
                                    @"title"         : @"这是一个段子标题",
                                    @"content"       : @"这是一个段子内容，这是一个段子内容，这是一个段子内容，这是一个段子内容，这是一个段子内容，这是一个段子内容。",
                                    @"images"        : @"img1,img2,img3",
                                    @"videos"        : @"video1,",
                                    @"category"      : @"程序员",
                                    @"countOfLike"   : @(54123),
                                    @"countOfDislike": @(9876),
                                    @"countOfComment": @(20),
                                    @"countOfClick"  : @(2345)};
        
        NSMutableArray * jokes = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 30; i ++) {
            
            NSMutableDictionary * tmpDict = [[NSMutableDictionary alloc] initWithDictionary:jokeDick];
            tmpDict[@"title"] = [NSString stringWithFormat:@"%@%ld", tmpDict[@"title"], i + 1];
            
            QPJoke * joke = [[QPJoke alloc] init];
            [joke setValuesForKeysWithDictionary:tmpDict];
            
            QPJokeFrame * jokeFrame = [[QPJokeFrame alloc] init];
            jokeFrame.joke = joke;
            
            [jokes addObject:jokeFrame];
        }
        
        self.dataList = jokes;
        /* 测试数据 */
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer resetNoMoreData];

//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//
////        NSLog(@"error\n%@", error);
//
//        [self.tableView.mj_header endRefreshing];
//        [self.tableView.mj_footer endRefreshing];
//    }];
}

- (void)loadMoreData {
 
     [self.tableView.mj_footer resetNoMoreData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    /*
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    NSDictionary * dict = self.dataList[indexPath.row];
    
//    NSString * responseTime = [dict valueForKey:@"created"];
//    NSString * dateTimeStr = [responseTime dateTimeStringFromResponseTime];
//
//    cell.textLabel.text = [dict valueForKey:@"code"];
//    cell.detailTextLabel.text = dateTimeStr; // [dateTimeStr timeIntervalStringFromTime];
    
    cell.textLabel.text = [dict valueForKey:@"title"];
    cell.detailTextLabel.text = [dict valueForKey:@"category"];
    
    return cell;
     */
    
    QPJokeCell * jokeCell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];

    jokeCell.jokeFrame = self.dataList[indexPath.row];
    
    return jokeCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary * dict = self.dataList[indexPath.row];
    
    NSLog(@"%@", dict);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    QPJokeFrame * jokeFrame = self.dataList[indexPath.row];
    
    return jokeFrame.cellHeight;
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
