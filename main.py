def print_infinite_binary_numbers():
    i = 0
    while True:
        print(bin(i)[2:])
        i += 1

# Start the infinite binary number generator
print_infinite_binary_numbers()
