//
//  BFHomeVC.m
//  5p
//
//  Created by 张逸阳 on 2019/3/8.
//  Copyright © 2019年 毕方. All rights reserved.
//

#import "BFHomeVC.h"
#import "PDRCoreAppManager.h"
#import "PDRToolSystem.h"
#import "PDRToolSystemEx.h"
@interface BFHomeVC ()<PDRCoreDelegate,PDRCoreAppWindowDelegate>
{
    PDRCoreApp* pAppHandle;
}
@end

@implementation BFHomeVC

static UIView* pContentVIew = nil;

- (void)loadView {
    [super loadView];
    if(pContentVIew == nil)
        pContentVIew = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview: pContentVIew];
    
    PDRCore *h5Engine = [PDRCore Instance];
    h5Engine.coreDeleagete = self;
    h5Engine.persentViewController = self;
    NSString* pWWWPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Pandora/apps/HelloH5/www"];
    
    [[PDRCore Instance] setContainerView:pContentVIew];
    NSString* pArgus = @"id=plus.runtime.arguments";
    pAppHandle = [[[PDRCore Instance] appManager] openAppAtLocation:pWWWPath withIndexPath:@"index.html" withArgs:pArgus withDelegate:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}



- (void)dealloc {
    [[PDRCore Instance] setContainerView:nil];
}


@end
