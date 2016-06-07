//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        [self resetBoard];
    }
    
    return self;
}

-(void)resetBoard {
    
    //    should clear the game board of all player moves, so that a new game can begin. - method
    _board = [@[[@[@"", @"", @"" ]mutableCopy],
                [@[@"", @"", @"" ]mutableCopy],
                [@[@"", @"", @""]mutableCopy]]mutableCopy];
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row {
    // determines what player has a piece at the given position - this will return the string X, O, or empty
    
    return _board[column][row];
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row{
    
    NSString *location = _board[column][row];
    
    // returns YES if location is a valid place || valid place is an empty string
    
    if([location isEqualToString:@""]) {
        return YES;
    }else {
        return NO;
    }
    
    return YES;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row{
    //write x at that column
    [self canPlayAtColumn:column row:row];
    self.board[column][row] = @"X";
    
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row{
    
    [self canPlayAtColumn:column row:row];
    self.board[column][row] = @"O";
    
}

-(NSString *)winningPlayer{
    
    //    // strong arm approach     // diagonals
    
    NSMutableArray *lineOfX = [@[@"X", @"X", @"X"]mutableCopy];
    NSMutableArray *lineOfO = [@[@"O", @"O", @"O"]mutableCopy];
    
    if([self.board[0] isEqual:lineOfO] || [self.board[0] isEqual:lineOfX]) {
        return self.board[0][0];
    }else if([self.board[1] isEqual:lineOfO] || [self.board[1] isEqual:lineOfX]) {
        return self.board[1][0];
    }else if ([self.board[2] isEqual:lineOfO] || [self.board[2] isEqual:lineOfX]){
        return self.board[2][0];
    } else if ([self.board[0][0] isEqualToString:self.board[1][0]] && [self.board[1][0] isEqualToString:self.board[2][0]]) {
        return self.board[0][0];
    }else if ([self.board[0][1] isEqualToString:self.board[1][1]] && [self.board[1][1] isEqualToString:self.board[2][1]]) {
        return self.board[0][1];
    }else if([self.board[0][2] isEqualToString:self.board[1][2]] && [self.board[1][2] isEqualToString:self.board[2][2]]) {
        return self.board[0][2];
    } else if([self.board[0][0] isEqualToString:self.board[1][1]] && [self.board[1][1] isEqualToString:self.board[2][2]]) {
        return self.board[2][2];
    } else if([self.board[0][2] isEqualToString:self.board[1][1]] && [self.board[1][1] isEqualToString:self.board[2][0]]) {
        return self.board[2][0];
    }
    
        return @"";
    }
    
    -(BOOL)isADraw {
        
        // if there is an empty string in the row = can't be a full row
        
        if ([self.board[0] containsObject:@""] || [self.board[1] containsObject:@""] || [self.board[2] containsObject:@""] ) {
            return NO;
        }
        
        return YES;
    }
    
    @end
    
