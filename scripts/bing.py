import webbrowser
import sys
import time

searches = ["nikola tesla", "linux torvolds", "dalai llama", "barack Obama", "Alan turing", "elvis presley", "Steve Jobs", "Bill Gates", "The linux foundation", "Cloud native computing foundation", "The nature conservancy", "brandon sanderson", "duckduckgo", "vim", "Fedora linux", "DigitalOcean", "ubuntu", "arch linux", "linux kernel", "gnu software", "free software foundation", "mark shuttleworth", "jim whitehurst", "kubernetes", "finland", "linux containers", "android", "amd", "cri-o", "git"]
mobile = ["kindle", "tiny house", "Mistborn", "stormlight archives", "vivaldi browser", "opensuse", "freebsd", "openbsd", "canonical ubuntu", "late night linux", "linux unplugged", "gnome software", "kde desktop", "solar panels", "vegna restaurants", "national parks", "Red Hat", "helicopter", "spain", "portugal", "mexico", "hawaii", "new jersey", "virginia", "south carolina"]
edge = ["test1", "test2", "test3", "test4", "test4", "test5", "test6", "test7", "test8", "test9", "test10", "test12", "test13", "test16", "test20"] 
search_engine = "https://www.bing.com"
query_format = "/search?q="
webbrowser.open("https://www.bing.com")
if len(sys.argv) < 2:
    for s in searches:
        webbrowser.open_new_tab(search_engine + query_format + s)
        time.sleep(.75)
elif 'm' in sys.argv[1] or 'mobile' in sys.argv[1]:
    for s in mobile:
        webbrowser.open_new_tab(search_engine + query_format + s)
        time.sleep(.75)
elif 'e' in sys.argv[1] or 'edge' in sys.argv[1]:
    for s in edge:
        webbrowser.open_new_tab(search_engine + query_format + s)
        time.sleep(.75)
