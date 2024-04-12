class AddHeader:
    def request(self, flow):
        if str(flow.request.text).find('"contentType":"application/x-trash"') != -1:
            pos = str(flow.request.text).find('"contentType":"application/x-trash"')
            print("Found cc!!!")
            flow.request.text = flow.request.text[:pos] + '"cacheControl":"no-cache",' + flow.request.text[pos:]
            print(flow.request.text)
            flow.request.headers["cache-control"] = "no-cache"
        elif str(flow.request.text).find('"contentType":"text/vnd.qt.linguist; charset=utf-8"') != -1:
            pos = str(flow.request.text).find('"contentType":"text/vnd.qt.linguist; charset=utf-8"')
            flow.request.text = flow.request.text[:pos] + '"cacheControl":"public, max-age=3600",' + flow.request.text[pos:]
            print("Updated cache control for .ts file")

            
addons = [AddHeader()]