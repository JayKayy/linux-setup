# Used as a quick script to export current feeds from feedreader in order
# to move/recreate the current feed configuration

import sqlite3
DB_PATH="/home/jkwiatko/.local/share/feedreader/data/feedreader-7.db"

db=sqlite3.connect(DB_PATH)
cursor = db.cursor()
cursor.execute("select name,url,xmlURL,categories.title as category from feeds LEFT JOIN categories ON feeds.category_id=categories.categorieID ORDER BY category")

output=cursor.fetchall()
for feed in output:
    title = feed[0]
    url = feed[1]
    rss = feed[2]

    
