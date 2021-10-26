import java.util.*;
class secondary {

    public static void main(String[] args ) {
        int min = 0;
        int max = 100;
        int resultUsr;
        char operator;
        do {
            int result=0;
            int a = (int)Math.floor(Math.random()*(max-min+1)+min);
            int b = (int)Math.floor(Math.random()*(max-min+1)+min);
            // Calculation
            // create an object of Scanner class
            Scanner input = new Scanner(System.in);
            // ask users to enter operator
            System.out.println("Choose an operator: +, -, or *");
            operator = input.next().charAt(0);
            switch (operator) {
                // performs addition between numbers
                case '+':
                    result = a + b;
                    System.out.println(a + " + " + b + " = ?");
                    break;
                // performs subtraction between numbers
                case '-':
                    result = a - b;
                    System.out.println(a + " - " + b + " = ?");
                    break;
                // performs multiplication between numbers
                case '*':
                    result = a * b;
                    System.out.println(a + " * " + b + " = ?");
                    break;

                default:
                    System.out.println("Invalid operator!");
                    break;
            }
            int counter = 0;
            do {
                if (counter == 0) {
                    resultUsr =
                            Input.inputInt("Antwort: ");
                    counter++;
                } else {
                    resultUsr = Input.inputInt("Antwort falsch try again: ");
                }
            } while(resultUsr != result);


        } while (!Input.inputBoolean("Wollen sie aufhören? (y/n)"));
    }
}