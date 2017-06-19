//
//  ViewController.m
//  WJTool
//
//  Created by 陈威杰 on 2017/6/7.
//  Copyright © 2017年 ChenWeiJie. All rights reserved.
//

#import "ViewController.h"

#import "MBProgressHUD+WJExtension.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (0 == indexPath.row) {
        cell.textLabel.text = @"只显示文字HUD";
    } else if (1 == indexPath.row) {
        cell.textLabel.text = @"操作成功";
    } else if (2 == indexPath.row) {
        cell.textLabel.text = @"操作失败";
    } else if (3 == indexPath.row) {
        cell.textLabel.text = @"自定义HUD图标";
    } else if (4 == indexPath.row) {
        cell.textLabel.text = @"横条加载样式";
    } else if (5 == indexPath.row) {
        cell.textLabel.text = @"开扇类型的加载样式";
    } else if (6 == indexPath.row) {
        cell.textLabel.text = @"环形加载样式";
    } else if (7 == indexPath.row) {
        cell.textLabel.text = @"显示菊花";
    } else if (8 == indexPath.row) {
        cell.textLabel.text = @"自定义HUD中的View视图";
    } else if (9 == indexPath.row) {
        cell.textLabel.text = @"操作成功碎花粒子效果";
    } else if (10 == indexPath.row) {
        cell.textLabel.text = @"显示碎花粒子效果";
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.row) {
        
//        [MBProgressHUD wj_showText:@"Hello World !" view:nil];
        [MBProgressHUD wj_showPlainText:@"Hello World !" view:nil];
//        [MBProgressHUD wj_showPlainText:@"Hello World !" hideAfterDelay:3.0 view:nil];
        
    } else if (1 == indexPath.row) {
        
//        [MBProgressHUD wj_showSuccess:@"操作成功"];
        [MBProgressHUD wj_showSuccess:@"操作成功" hideAfterDelay:2.0 toView:nil];
        
    } else if (2 == indexPath.row) {
        
//        [MBProgressHUD wj_showError:@"操作失败"];
        [MBProgressHUD wj_showError:@"操作失败" hideAfterDelay:2.0 toView:nil];
        
    } else if (3 == indexPath.row) {

//        [MBProgressHUD wj_showIcon:[UIImage imageNamed:@"icon_component"] message:@"测试图标" view:nil];
//        [MBProgressHUD wj_showIcon:[UIImage imageNamed:@"icon_component"] message:@"测试图标"];
        [MBProgressHUD wj_showIcon:[UIImage imageNamed:@"icon_component"] message:@"测试图标" hideAfterDelay:3.0 view:nil];
        
    } else if (4 == indexPath.row) {
        
        MBProgressHUD *hud = [MBProgressHUD wj_showLoadingStyle:WJHUDLoadingStyleDeterminateHorizontalBar];
        
        // 在获取到进度信息的地方设置HUD的progress
        [hud showAnimated:YES whileExecutingBlock:^{
            float progress = 0.0f;
            while (progress < 1.0f) {
                hud.progress = progress;
                hud.labelText = [NSString stringWithFormat:@"正在加载...%.0f%%", progress * 100];
                progress += 0.01f;
                usleep(50000);
            }
        } completionBlock:^{
            [MBProgressHUD wj_hideHUD];
        }];
        
        
    } else if (5 == indexPath.row) {
        
        MBProgressHUD *hud = [MBProgressHUD wj_showLoadingStyle:WJHUDLoadingProgressStyleDeterminate message:@"正在加载..." toView:nil];
        
        // 在获取到进度信息的地方设置HUD的progress
        [hud showAnimated:YES whileExecutingBlock:^{
            float progress = 0.0f;
            while (progress < 1.0f) {
                hud.progress = progress;
                hud.labelText = [NSString stringWithFormat:@"正在加载...%.0f%%", progress * 100];
                progress += 0.01f;
                usleep(50000);
            }
        } completionBlock:^{
            [MBProgressHUD wj_hideHUD];
        }];
        
    } else if (6 == indexPath.row) {
        
        MBProgressHUD *hud = [MBProgressHUD wj_showAnnularLoading];
        
        // 在获取到进度信息的地方设置HUD的progress
        [hud showAnimated:YES whileExecutingBlock:^{
            float progress = 0.0f;
            while (progress < 1.0f) {
                hud.progress = progress;
                progress += 0.01f;
                usleep(50000);
            }
        } completionBlock:^{
            [MBProgressHUD wj_hideHUD];
        }];
        
        
        
    } else if (7 == indexPath.row) {
        
        MBProgressHUD *hud = [MBProgressHUD wj_showActivityLoading:@"正在加载..." toView:nil];
        //        MBProgressHUD *hud = [MBProgressHUD wj_showActivityLoading];
        
        // 菊花不会自动消失，需要自己移除
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud removeFromSuperview];
        });
        
        
    } else if (8 == indexPath.row) {
        
        [MBProgressHUD wj_showMessage:@"自定义View" hideAfterDelay:2.0 toView:nil customView:^UIView * _Nonnull{
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            UILabel *label = [UILabel new];
            label.backgroundColor = [UIColor grayColor];
            label.frame = view.frame;
            label.text = @"ssssss";
            label.textAlignment = NSTextAlignmentCenter;
            [view addSubview:label];
            
            return view;
        }];
        
    } else if (9 == indexPath.row) {
        
        [MBProgressHUD wj_showSuccessWithColouredRibbonAnimation:@"操作成功"];
//        [MBProgressHUD wj_showSuccessWithColouredRibbonAnimation];
//        [MBProgressHUD wj_showSuccessWithColouredRibbonAnimation:@"操作成功" hideAfterDelay:3.0];
        
    } else if (10 == indexPath.row) {
        
        [MBProgressHUD wj_showColouredRibbonAnimationWithHideTime:2.0];
        
    }
    
    
}


- (IBAction)show:(id)sender {
    
    //    [MBProgressHUD wj_showText:@"ssss" view:nil];
    
    //    [MBProgressHUD wj_showMessage:@"带有图片的消息" icon:[UIImage imageNamed:@"btn"] view:nil];
    
    //    [MBProgressHUD wj_showActivityLoading:@"正在加载..." toView:nil];
    //    [MBProgressHUD wj_showActivityLoadingtoView:nil];
    //    [MBProgressHUD wj_showActivityLoading:nil toView:nil];
    //    [MBProgressHUD wj_showActivityLoadingToView:nil];
    //    [MBProgressHUD wj_showActivityLoading];
    
    //    MBProgressHUD *hud = [MBProgressHUD wj_showDeterminateLoading:@"正在加载..." toView:nil];
    
    //    MBProgressHUD *hud = [MBProgressHUD wj_showLoadingStyle:WJHUDLoadingProgressStyleDeterminate message:@"hahahah" toView:nil];
    //    MBProgressHUD *hud = [MBProgressHUD wj_showLoadingStyle:WJHUDLoadingStyleAnnularDeterminate];
    //    MBProgressHUD *hud = [MBProgressHUD wj_showDeterminateLoading];
    //    [hud showAnimated:YES whileExecutingBlock:^{
    //        float progress = 0.0f;
    //        while (progress < 1.0f) {
    //            hud.progress = progress;
    //            hud.labelText = [NSString stringWithFormat:@"正在加载...%.0f%%", progress * 100];
    //            progress += 0.01f;
    //            usleep(50000);
    //        }
    //    } completionBlock:^{
    //        [MBProgressHUD wj_hideHUD];
    ////        [hud removeFromSuperViewOnHide];
    //    }];
    
    //    [MBProgressHUD wj_showSuccess:@"加载成功" toView:self.view];
    //    [MBProgressHUD wj_showSuccess:@"操作成功"];
    //    [MBProgressHUD wj_showError:@"操作失败"];
    //    [MBProgressHUD wj_showError:@"操作失败" toView:nil];
    //    [MBProgressHUD wj_showError];
    //    [MBProgressHUD wj_showSuccess];
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [MBProgressHUD wj_hideHUD];
    //    });
    
    
    
    //    /// MARK: - 自定义view
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    //    UILabel *label = [UILabel new];
    //    label.backgroundColor = [UIColor whiteColor];
    //    label.frame = view.frame;
    //    label.text = @"ssssss";
    //    label.textAlignment = NSTextAlignmentCenter;
    //    [view addSubview:label];
    //    [MBProgressHUD wj_showCustomView:label hideAfterDelay:3.0];
    
    //    [MBProgressHUD wj_showMessage:@"自定义View" hideAfterDelay:4.0 toView:nil customView:^UIView * _Nonnull{
    //
    //        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    //        UILabel *label = [UILabel new];
    //        label.backgroundColor = [UIColor whiteColor];
    //        label.frame = view.frame;
    //        label.text = @"ssssss";
    //        label.textAlignment = NSTextAlignmentCenter;
    //        [view addSubview:label];
    //
    //        return view;
    //    }];
    
    
    //    [MBProgressHUD wj_showHideAfterDelay:4.0 customView:^UIView * _Nonnull{
    //        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    //            UILabel *label = [UILabel new];
    //            label.backgroundColor = [UIColor whiteColor];
    //            label.frame = view.frame;
    //            label.text = @"ssssss";
    //            label.textAlignment = NSTextAlignmentCenter;
    //            [view addSubview:label];
    //
    //            return view;
    //
    //    }];
    
}


@end
