//
//  QPJokeDetailViewController.m
//  WowFun
//
//  Created by JackieQu on 2019/8/15.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPJokeDetailViewController.h"

@interface QPJokeDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITextField * commentField;

@property (nonatomic, strong) UITableView * commentTableView;

@end

@implementation QPJokeDetailViewController

- (UITextField *)commentField {

    if (!_commentField) {
        
        _commentField = [[UITextField alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60 - 44, SCREEN_WIDTH, 60)];
        _commentField.backgroundColor = [UIColor colorWithRed:180 green:180 blue:180 alpha:1];
        _commentField.placeholder = @"请输入评论内容";
        
        UIButton * commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        commentBtn.frame = CGRectMake(kMargin, kMargin, 100, 40);
        commentBtn.backgroundColor = [UIColor orangeColor];
        [commentBtn setTitle:@"发送评论" forState:UIControlStateNormal];
        [commentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _commentField.rightView = commentBtn;
        _commentField.rightViewMode = UITextFieldViewModeAlways;
    }
    return _commentField;
}

- (UITableView *)commentTableView {
 
    if (!_commentTableView) {
        
        _commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.jokeCell.contentView.frame), SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(self.jokeCell.contentView.frame) - CGRectGetHeight(self.commentField.frame) - 44) style:UITableViewStylePlain];
        _commentTableView.dataSource = self;
        _commentTableView.delegate = self;
    }
    return _commentTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self addObserver];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self removeObserver];
}

- (void)initUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.jokeCell.jokeFrame.joke.title;
    self.jokeCell.contentView.frame = CGRectMake(0, 88, SCREEN_WIDTH, self.jokeCell.jokeFrame.cellHeight);
    [self.view addSubview:self.jokeCell.contentView];
    [self.view addSubview:self.commentTableView];
    [self.view addSubview:self.commentField];
}

- (void)addObserver {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name: UIKeyboardWillHideNotification object:nil];
}

- (void)removeObserver {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = @"test";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.view endEditing:YES];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    
    NSDictionary * userInfo = [notification userInfo];
    NSValue * value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    
    CGRect frame = self.commentField.frame;
    frame.origin.y = SCREEN_HEIGHT - keyboardSize.height - frame.size.height;
    self.commentField.frame = frame;
}

-(void)keyboardWillHide:(NSNotification *)notification {
    
    CGRect frame = self.commentField.frame;
    frame.origin.y = SCREEN_HEIGHT - 60 - 44;
    self.commentField.frame = frame;
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
