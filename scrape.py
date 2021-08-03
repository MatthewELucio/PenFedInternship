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
    with open(filename +  ".txt", "a", encoding = "utf-8") as wf:
        for i in range(1, int(filenames[filename]["pages"]) + 1):
            req = Request(filenames[filename]["link"] + "?p=" + str(i), headers = {"User-Agent": "Mozilla/5.0"})
            page_html = urlopen(req).read()
            page_soup = soup(page_html, "html.parser")
            data = json.loads(page_soup.find("script", type="application/json").string)
            #print(data)
            for i in range(len(data["reviewsdata"]["reviews"])):
                for key in data["reviewsdata"]["reviews"][i]:
                    if(data["reviewsdata"]["reviews"][i]["is_official"] == False):
                        if(key == "content"):
                            text = data["reviewsdata"]["reviews"][i][key]
                            text = text.replace("\\u2019", "'")
                            text = text.replace("\\u2018", "'")
                            text = text.replace("&amp;", "&")
                            text = text.replace("\\n", "\n")
                            text = text.replace("\\n\\n", "\n")
                            text = text.replace("<br>", " ")
                            text = text.replace("<p>", "")
                            #text = text.replace("Â\x80Â\x9d'", "'")
                            wf.write(text)
                            wf.write("\n\n")
