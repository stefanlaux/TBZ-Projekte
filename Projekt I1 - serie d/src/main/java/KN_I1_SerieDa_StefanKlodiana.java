import java.util.Scanner;
package ch.tbz;
import java.lang.Math;

public class KN_I1_SerieDa_StefanKlodiana {

    public static void main(String[] args) {

        int min = 1;
        int max = 100;
        int b = (int)(Math.random()*(max-min+1)+min);
        int a = (int)(Math.random()*(max-min+1)+min);
        int c;

        do {
            int operator = inputInt("What operator do you want to train? [1] Addition \b [2] Subtraction \b [3] Multiplication");

            if(operator == 1) {
                System.out.println(a + b);
            }
        }



    }
}
