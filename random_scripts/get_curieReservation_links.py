import datetime
import calendar
import time

import argparse

now = datetime.datetime.now()

parser = argparse.ArgumentParser(description='Get links for reserving rooms at curie')
parser.add_argument('-d', '--day', dest='weekday', type=int, default = 2, help='Index of the name of the week (Monday = 1; Sunday = 7)')
parser.add_argument('-m', '--first_month', dest='first_month', type=int, default = now.month, help='First month number.')
parser.add_argument('-l', '--last_month', dest='last_month', type=int, default = 12, help='Last month number.')
parser.add_argument('-y', '--year', dest='year', type=int, default = now.year, help='Year.')
args = parser.parse_args()

baseURL = 'http://ads.curie.fr/cgi-bin/reservations/grille.sh?resa+'

year = args.year
firstMonth = args.first_month
lastMonth = args.last_month + 1
weekday = args.weekday - 1

rooms = [
    # tier 1
    "lacassagne", "curie", "lhomond",
    # tier 2
    "bddcour1", "bddcour2",
    # tier 3
    "annexe1", "annexe2", "annexe3",
    # tier 4
    "bddannexe1", "bddannexe2", "bddannexe3", "bddannexe4",
    # tier 5 salle25u6
    "salle25u6"]

frMonths = ["Janvier", "F%E9vrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Ao%FBt", "Septembre", "Octobre", "Novembre", "D%E9cembre"]
frWeekdays = [ "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche" ]
frWeekday = frWeekdays[weekday]

i = 1
for room in rooms:
    for month in range(firstMonth, lastMonth):
        frMonth = frMonths[month - 1]

        print("Reservations for {} {}, room {}".format(frMonth, year, room))

        c = calendar.monthcalendar(year, month)
        tuesdays = [x[weekday] for x in c if x[weekday] != 0]

        for day in tuesdays:
            print('{}\t{}{}+{}+{}+{}+{}+{}.{}+{}'.format(day, baseURL, day, month, year, frWeekday, frMonth, time.strftime("%Y%m%d%H%M%S"), str(i).zfill(5), room))
            i += 1

    input("Press Enter for the next room or Ctrl+C to end.")
