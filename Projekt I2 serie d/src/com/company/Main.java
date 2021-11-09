package com.company;

import java.util.Objects;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        boolean y = true;

        Scanner scanner = new Scanner(System.in);
        while (y) {
            System.out.println("Geben sie drei Zahlen ein:");
            System.out.print("1. ");
            int number1 = scanner.nextInt();
            System.out.print("2. ");
            int number2 = scanner.nextInt();
            System.out.print("3. ");
            int number3 = scanner.nextInt();

            if (number1 == number2 && number1 != number3) {
                System.out.println("Zwei Zahlen sind gleich nämlich " + number1);
            } else if (number1 == number3 && number1 != number2) {
                System.out.println("Zwei Zahlen sind gleich nämlich " + number1);
            } else if (number3 == number2 && number3 != number1) {
                System.out.println("Zwei Zahlen sind gleich nämlich " + number3);
            } else if (number1 == number2 && number1 == number3) {
                System.out.println("Alle Zahlen sind gleich!");
            } else if (number1 != number2 && number1 != number3 && number2 != number3) {
                System.out.println("Alle Zahlen sind verschieden!");
            }

            boolean wrongInput = false;
            while (!wrongInput) {
                System.out.print("Wollen sie weiter machen?(y/n): ");
                String tempInput = scanner.nextLine();
                if (tempInput.equalsIgnoreCase("y")) {
                    wrongInput = true;
                    y = true;
                } else if (tempInput.equalsIgnoreCase("n")) {
                    wrongInput = true;
                    y = false;
                }
            }

        }
    }

}
