//
//  ViewController.m
//  NSUserDefaultsDemo
//
//  Created by 梁雅軒 on 2017/6/3.
//  Copyright © 2017年 zoaks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) NSUserDefaults *userDefaults;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //將usedefaults 指向 slef.userDefaults
    _userDefaults = [NSUserDefaults standardUserDefaults];
    
    //設定button被選擇文字
    [_btnLogin setTitle:@"登出" forState:UIControlStateSelected];
    
    //向userDefaults取出key為isLogin的bool value
    //並且設定button目前是否被選擇
    _btnLogin.selected = [_userDefaults boolForKey:@"isLogin"];
}
//關掉app
- (IBAction)btnOnCloseApp:(UIButton *)sender
{
    kill(getpid(), SIGKILL);
}

//按鈕按下去時
- (IBAction)btnOnClick:(UIButton *)sender
{
    if (sender.selected) {
        //將key為isLogin的value設為NO
        [_userDefaults setBool:NO forKey:@"isLogin"];
    } else {
        //將key為isLogin的value設為YES
        [_userDefaults setBool:YES forKey:@"isLogin"];
    }
    //儲存useDefaults
    [_userDefaults synchronize];
    //改變按鈕被選擇狀態
    sender.selected = !sender.selected;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
