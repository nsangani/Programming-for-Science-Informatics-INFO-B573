# -*- coding: utf-8 -*-
"""Assignment_2

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1r7KDGb5waxaay5Gc7dWSlYo_EhvGzVLw
"""

print('Q1.')

print('\n' + '#1' )
length = 10
width = 7
print('Perimeter of Rectangle is', str(2*length + 2*width) + 'cm')
print('Area of Rectangle is', str(10*7) + 'cm')

print('\n' + '#2' )
# Pythagoras = a^2 + b^2 = c^2

h = 7
b = 10
print('Length of Hypotenuse is', str(int((7**2 + 10**2)**0.5)) + 'cm')

print('Q2.')

list1 = [1,3,5,6,7,8,9] 
list2 = ['the', 'if', 'and', 'this', 'for']

print('\n' + '#1' ) # third to sixth elements of list1
print(list1[2:5])

print('\n' + '#2' ) # remove last elememnt from list2
list2.pop(-1)
print(list2)

print('\n' + '#3' ) # replace 4th element with B573 in list1
list1[3] = 'B573'
print(list1)

print('Q3.')

dict = {}
Gene_ID = ['ENSG00000185432','ENSG00000003987', 'ENSG00000124935', 'ENSG00000186187', 'ENSG00000161217']
Ontology = ['GO:0016020', 'GO:0005737', 'GO:0005615', 'GO:0070936', 'GO:0006657']

# zip gene_id and ontology list into a dictionary
dict = {Gene_ID[i]: Ontology[i] for i in range(len(Gene_ID))}
print(dict)

print('\n' + '#1' ) # all the gene_ids
print("All the Gene_IDs or Keys of the dictionary 'dict':")
for keys,values in dict.items():
  print(keys)

print('\n' + '#2' ) # ontology of the given gene_id
for i in dict.keys():
  if i == 'ENSG00000003987':
    print('Ontology of Gene_ID: ENSG00000003987 is', values)

print('\n' + '#3' ) # if gene_id present, print yay else add new ontology to dict
i = 'ENSG00000256206'
if i in dict.keys():
  print('Yay')
else:
    dict['ENSG00000256206'] = 'GO:0005737'

print(dict)

print('Q4.')

# Two User Input
response1 = input('Type a number: ')
response2 = input('Type another number larger than previous number: ')
output = []
for i in range(int(response1),int(response2)):
    if i % 7 == 0 and i % 5 == 0:
        output.append(i)
print(output)