//
//  main.m
//  Blocks
//
//  Created by Eduardo Vital Alencar Cunha on 27/03/17.
//  Copyright © 2017 Vital. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double (^calcularMedia)(double, double, double) = ^(double notaA, double notaB, double notaC) {
            return (notaA + notaB + notaC) / 3.0 ;
        };

        NSLog(@"A média das notas é: %.2f.", calcularMedia(10, 9, 3));

        __block int i = 9;

        void (^incrementar)(void) = ^{
            i++;
        };

        incrementar();
        NSLog(@"i = %d", i);

        void (^callback)(void) = ^{
            printf("\nA contagem foi realizada com sucesso.\n");
        };

        void (^contagemRegressivaComCallback)( void(^)(void) ) = ^( void(^callback)(void) ) {
            for (i = 10; i > 0; i--) {
                // No Xcode 8.3 o printf não funciona com o [NSThread sleepForTimeInterval]
                //NSLog(@"%d ", i);
                printf("%d ", i);

                [NSThread sleepForTimeInterval:1];
            }
            callback();
        };

        contagemRegressivaComCallback(callback);
    }
    return 0;
}
