//
//  UILabel+HTML.m
//  Pods
//
//  Created by Nikhil Thiruvengadam on 2016-08-12.
//
//

#import "UILabel+HTML.h"

@implementation UILabel (HTML)

- (void)setHtmlFromString:(NSString *)string {
    
    string = [string stringByAppendingString:[NSString stringWithFormat:@"<style>body{font-family: '%@'; font-size:%fpx;}</style>",
                                              self.font.fontName,
                                              self.font.pointSize]];
    self.attributedText = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding]
                                                           options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                     NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                documentAttributes:nil
                                                             error:nil];
}

@end
