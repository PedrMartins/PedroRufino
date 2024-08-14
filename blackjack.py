import random 
cards = [] 
suits= ["hearts", "diamonds","spades", "clubs"]
ranks = ['A','2','3','4','5','6','7','8','9','10','J','K', 'Q']
for suit in suits:
    for rank in ranks:
        cards.append ([suit,rank])

random.shuffle (cards)
card = cards.pop ()
print (card)

def shuffle ():
    random.shuffle (cards)

def deal (number):
    cards_delt = []
    for x in range (number):
        card= cards.pop ()
        cards_delt.append (card)
    return cards_delt

cards_delt = deal (3)
card= cards_delt [0]
print (card)
rank= card [1]

if rank == 'A':
    value = 11
elif rank == 'J' or  rank == 'K' or rank == 'K':
    value = 10
else:
    value = rank

rank_dict = {"rank": rank, "value": value}

print (rank_dict ['value'], rank_dict['rank'])

def shuffle ():
    random.shuffle (cards)
    
def deal (number):
    cards_delt = []
    for x in range (number):
        card= cards.pop ()
        cards_delt.append (card)
    return cards_delt


deal (5)
