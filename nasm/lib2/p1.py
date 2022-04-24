import itertools


lst = ['a', 'b', 'c']

c = list(itertools.permutations(lst, 2))
print(*c, len(c), sep='\n')

cwr = list(itertools.combinations_with_replacement(lst, 2))
print(*cwr, len(cwr), sep='\n')

p = list(itertools.product(lst))
print(*p, len(p), sep='\n')





