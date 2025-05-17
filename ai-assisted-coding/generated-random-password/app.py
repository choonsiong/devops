#!/usr/bin/env python3

import secrets
import string

def generate_password(length):
    chars = string.ascii_letters + string.digits + string.punctuation
    return ''.join(secrets.choice(chars) for _ in range(length))

if __name__ == "__main__":
    try:
        n = int(input("Enter password length: "))
        if n <= 0:
            print("Password length must be positive.")
        else:
            print("Generated password:", generate_password(n))
    except ValueError:
        print("Please enter a valid integer.")

