
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Trip : NSObject{
    int hour;
    int minute;
    int timeDuration;
    int tripDuration;
    int begTime;
    int endTime;
    double cost;
    int customer;
        double initVelocity;

}


-(id)initWithCustomer:(int)ncustomer;
-(void)setCustomer:(int)ncustomer;
-(int)getCustomer;
-(void)setCost;
-(double)getCost;
-(void)setHour:(int)input;
-(int)getHour;
-(void)setMinute:(int)input;
-(int)getMinute;
-(void)setBegTime:(int)time;
-(int)getBegTime;
-(void)setEndTime:(int)time;
-(int)getEndTime;
-(void)setTripDuration:(int)duration;
-(int)getTripDuration;
-(int)CalculateTrip:(int)begTime end:(int)endTime;
-(bool)tripInvalid;
-(void)setInitVelocity:(double)velocity;
-(double)getInitVelcocity;
@end

NS_ASSUME_NONNULL_END
