import json
import os
db_file = os.path.dirname(os.path.abspath(__file__))+'/db-config.json' # This is your Project Root
config = json.load(open(db_file))  #load db in json format