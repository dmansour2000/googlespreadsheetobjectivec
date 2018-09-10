//
//  UIHelper.h
//  Test App
//
//  Created by Dina Mansour on 9/8/18.
//  Copyright © 2018 StarWallet Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIHelper : NSObject

+(void)setDefualtUI:(UIViewController *)viewController;

// ProgressBar
+(void)showProgressBar;
+(void)showProgressBarWithDimView;
+(void)dissmissProgressBar;
+(void)showProgressBarWithDimViewAndStatus:(NSString *)status;
+(void)dissmissProgressBarWithErrorMessage:(UIView *)view;

// Show Message
+(void)showErrorMessage:(NSString *)errorMessage Title:(NSString *)title;
+(void)showInformativeMessage:(NSString *)message Title:(NSString *)title;
+(void)showSuccessMessage:(NSString *)message Title:(NSString *)title;
+(void)showErrorMessageWithErrorCode:(int)errorCode andErrorMessage:(NSString *)errorMessage Title:(NSString *)title;

+(void)hideKeyBoard:(UIView *)view;

// Shadow
+ (void)addShadow:(UIView*)view;

// hieght
+ (CGFloat)calculateHeightForHtmlText:(NSString*)htmlText;
+ (CGFloat)calculateHeightForEventInfoHtmlText:(NSString*)htmlText;

+(UIImageView *)roundImage:(UIImageView *)image;
+(UIImageView *)roundImageAndSetborder:(UIImageView *)image;
+(UIView *)setCurvedCornerToView:(UIView *)view;

+ (void) alignLabelWithTop:(UILabel *)label;
+(NSString *)checkLangauge:(NSString *)text;
+(NSString *) stringByStrippingHTML:(NSString *)str;
+(CGRect)rectForText:(NSString *)text usingFont:(UIFont *)font boundedBySize:(CGSize)maxSize;
+(UILabel *)setCurvedBorderToView:(UIView *)view ;

+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize ;

+ (void)downloadImage:(NSString *)imageUrl andImage:(UIImageView *)imageView andImagePlaceholderName:(NSString*)imagePlaceholderName andIndicator:(UIActivityIndicatorView *)indicator;

+ (CGSize)calculateHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(NSDictionary *)fontDictionary;

+(Boolean) isIPhone4;
+(Boolean)  isIPhone5;
+(Boolean)  isIPhone6;
+(Boolean)  isIPhone6Plus;
+(Boolean)  isIPhoneX;
+(UIView *)setCornerAndShadow:(UIView *)view;
+(UITextField *)setTextFieldIcon:(UITextField *)textField andIcon:(NSString *)icon;
+(UIScrollView *)setViewSize:(UIScrollView *)scrollView;
+(UITableView *)setMainViewSize:(UITableView *)tableView;
+(UILabel *)setLabelColor:(UILabel *)label;
+(UILabel *)setTextColor:(UILabel *)text;
+(UIButton *)setButtonColor:(UIButton *)button;
@end
