#!/bin/bash
python3 -c "import random;n=8*12;print(''.join([chr(random.randint(48, 57)) for x in range(n)]),end='')" | ./sort96.out | python3 -c "a=input();r='\n'.join(''.join(list(reversed(a[i:i+12]))) for i in range(0,len(a),12));print(r)"

