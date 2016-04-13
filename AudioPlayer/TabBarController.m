//
//  TabBarController.m
//  AudioPlayer
//
//  Created by ClaudeLi on 16/4/13.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import "TabBarController.h"
#import "MusicsViewController.h"
#import "AudioPlayerController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MusicsViewController *music = [[MusicsViewController alloc] init];
    UINavigationController *navgation = [[UINavigationController alloc] initWithRootViewController:music];
    self.viewControllers = @[navgation];
    
    [self creatTabBar];
}

- (void)creatTabBar{
    for (UIView *subView in [self.tabBar subviews]) {
        Class class = NSClassFromString(@"UITabBarButton");
        
        if ([subView isMemberOfClass:class]) {
            
            [subView removeFromSuperview];
        }
    }
    UIButton* button = [UIButton new];
    button.frame = CGRectMake(0, 0, 100, 49);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"player" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:button];
}

- (void)clickButtonAction{
    [self presentViewController:[AudioPlayerController audioPlayerController] animated:YES completion:nil];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

//- (void) viewWillDisappear:(BOOL)animated {
//    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
//    [self resignFirstResponder];
//    [super viewWillDisappear:animated];
//}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) remoteControlReceivedWithEvent:(UIEvent *) receivedEvent{
    if (receivedEvent.type == UIEventTypeRemoteControl) {
        switch (receivedEvent.subtype) {
            case UIEventSubtypeRemoteControlPause:
                //点击了暂停
                [[AudioPlayerController audioPlayerController] playerStatus];
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                //点击了下一首
                [[AudioPlayerController audioPlayerController] theNextSong];
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                //点击了上一首
                [[AudioPlayerController audioPlayerController] inASong];
                break;
            case UIEventSubtypeRemoteControlPlay:
                //点击了播放
                [[AudioPlayerController audioPlayerController] playerStatus];
                break;
            default:
                break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
