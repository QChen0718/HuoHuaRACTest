//
//  HHAudioViewController.m
//  RACHHTest
//
//  Created by White-C on 2019/7/5.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHAudioViewController.h"
#import "HHAudioView.h"
#import "HHAudioViewModel.h"
@interface HHAudioViewController ()
@property (nonatomic,strong)HHAudioViewModel *audioviewModel;
@property (nonatomic,strong)HHAudioView *audioView;
@end

@implementation HHAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.audioView];
}
- (HHAudioViewModel *)audioviewModel
{
    if (!_audioviewModel) {
        _audioviewModel = [[HHAudioViewModel alloc]initWithTarget:self];
    }
    return _audioviewModel;
}
- (HHAudioView *)audioView
{
    if (!_audioView) {
        _audioView = [[HHAudioView alloc]initWithViewModel:self.audioviewModel parameters:nil];
    }
    return _audioView;
}


@end
