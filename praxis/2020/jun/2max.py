def sum_number(n):
    total = 0
    for d in str(n):
        total = total + int(d)
    return total

def max_lookup_dict(number_list):
    lookup_dict = {}
    for n in number_list:
        index = sum_number(n)
        if not index in lookup_dict:
            lookup_dict[index] = [n]
        elif n > lookup_dict[index][0]:
            lookup_dict[index][1] = lookup_dict[index][0]
            lookup_dict[index][0] = n
        elif len(lookup_dict[index]) == 1:
            lookup_dict[index].append(n)
        elif n > lookup_dict[index][1]:
            lookup_dict[index][1] = n
    return lookup_dict

def main():
    number_list = [51, 71, 17, 26, 12, 42]
    lookup_dict = max_lookup_dict(number_list)
    for key, values in lookup_dict.items():
        total = (-1, sum(values))[len(values) == 2]
        print(key, total, values)

main()