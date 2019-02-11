# Used as a quick script to export current feeds from feedreader in order
# to move/recreate the current feed configuration

import sqlite3
DB_PATH="/home/USERNAME/.local/share/feedreader/data/feedreader-7.db"
print("Using database: {}".format(DB_PATH))
db=sqlite3.connect(DB_PATH)
cursor = db.cursor()
cursor.execute("select name,url,xmlURL,categories.title as category from feeds LEFT JOIN categories ON feeds.category_id=categories.categorieID ORDER BY category")
formatting = ['<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n', '<opml version=\"2.0\">\n', '<head>\n','\t<title>FeedReader Exported RSS Feeds</title>\n','</head>\n','<body>\n']
exports = open("feeds_export.opml", "w")

exports.writelines(formatting)
output = cursor.fetchall()
for feed in output:
    title = feed[0]
    url = feed[1]
    rss = feed[2]
    exports.write('\t<outline title=\"{0}\" text=\"{0}\" type=\"rss\" htmlUrl=\"{1}\" xmlUrl=\"{2}\"/>\n'.format(title, url, rss))

exports.write('\t</body>\n')
exports.write('</opml>\n')
exports.close()

print("Exported to {}".format(exports.name))
