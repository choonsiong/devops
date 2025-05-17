def factorize(x):
    """
    Factorial function that calculates the factorial of a number.
    :param x: The number to calculate the factorial for.
    :return: The factorial of the number.
    """
    if x < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    elif x == 0 or x == 1:
        return 1
    else:
        result = 1
        for i in range(2, x + 1):
            result *= i
        return result

def main(): 
    """
    Main function to run the factorial calculation.
    """
    try:
        number = int(input("Enter a number to calculate its factorial: "))
        print(f"The factorial of {number} is {factorize(number)}")
    except ValueError as e:
        print(e)

if __name__ == "__main__":
    main()