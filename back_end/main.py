import json
from Invoice import Invoice
from Product import Product

def main():
    product = Product(1, "prod1", 2500)
    print(json.dumps(product.__dict__))

if __name__ == "__main__":
    main()