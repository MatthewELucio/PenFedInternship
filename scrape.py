from urllib.request import Request, urlopen
from bs4 import BeautifulSoup as soup
import json
#filenames = {"PenFed" : {"link" : "https://wallethub.com/profile/penfed-credit-union-13307097i", "start" : "1", "pages" : "40"}}
#filenames = {"USAA" : {"link" : "https://wallethub.com/profile/usaa-bank-13007646i", "pages" : "63"}} 
filenames = {"Capital One" : {"link" : "https://wallethub.com/profile/capital-one-13001087i", "pages" : "400"}}
#filenames = {"BECU" : {"link" : "https://wallethub.com/profile/boeing-employees-credit-union-13312188i", "pages" : "14"}}
for filename in filenames:
    req = Request(filenames[filename]["link"], headers = {"User-Agent": "Mozilla/5.0"})
    page_html = urlopen(req).read()
    page_soup = soup(page_html, "html.parser")
    data = json.loads(page_soup.find("script", type="application/json").string)
    with open(filename +  ".json", "a", encoding = "utf-8") as wf:
        for i in range(1, int(filenames[filename]["pages"]) + 1):
            req = Request(filenames[filename]["link"] + "?p=" + str(i), headers = {"User-Agent": "Mozilla/5.0"})
            page_html = urlopen(req).read()
            page_soup = soup(page_html, "html.parser")
            data = json.loads(page_soup.find("script", type="application/json").string)
            json.dump(data, wf)
            
