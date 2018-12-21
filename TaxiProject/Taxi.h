
#import <Foundation/Foundation.h>
#import "MathEquations.h"
#import "Trip.h"


NS_ASSUME_NONNULL_BEGIN

@interface Taxi : NSObject{
    float gas;
    float miles;
    double netIncome;
    NSMutableArray *Trips;

}

-(id)initWithGas:(float)mileage;
-(void)setGas:(float)litres;
-(float)getGas;
-(void)setNetIncome:(double)income;
-(double)getNetIcome;
-(void)setMiles:(float)mileage;
-(float)getMiles;
-(void)calculateMiles;
-(bool)gasLow;
-(NSMutableArray *)getTrip;
-(void)setTrip:(Trip*)customerTrip;
-(void)gasUp;


@end

NS_ASSUME_NONNULL_END
