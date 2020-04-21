def GCD(a, b):
    if b == 0:
        return a
    else:
        return GCD (b, a % b)

def lcm(x, y):
   if x > y:
       greater = x
   else:
       greater = y
   while(True):
       if((greater % x == 0) and (greater % y == 0)):
           lcm = greater
           break
       greater += 1
   return lcm


if __name__=="__main__":
    a=int(input("Enter value of a:"))
    b=int(input("Enter value of b:"))
    print ("Gcd of",a ,"and",b,"is",GCD(a,b))
    print("LCM of", a,"and", b,"is", lcm(a, b))
    