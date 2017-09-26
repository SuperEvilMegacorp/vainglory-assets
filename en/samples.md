# Samples

The samples endpoint provides an easy way to access hourly batches of random match data to aggregate stats.

{% method %}
## Get a collection of Samples

This endpoint retrieves a collection of randomly selected matches.

{% sample lang="shell" %}
```shell
curl "https://api.dc01.gamelockerapp.com/shards/na/samples" \
  -H "Authorization: Bearer <api-key>" \
  -H "Accept: application/vnd.api+json"
```

{% sample lang="java" %}
```java
//There are a variety of Java HTTP libraries that support query-parameters.
```

{% sample lang="python" %}
```python

```

{% sample lang="ruby" %}
```ruby

```

{% sample lang="js" %}
```javascript

```

{% sample lang="go" %}
```go

```

{% sample lang="swift" %}
```swift
    let urlString = "https://api.dc01.gamelockerapp.com/shards/na/samples"

func downloadJsonWithTask() {
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as URL?)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        downloadTask.addValue("APIKey", forHTTPHeaderField: "Authorization")
        downloadTask.addValue("application/vnd.api+json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: downloadTask) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
            print(jsonData!.value(forKey: "data") as Any)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }


```

{% common %}
> The above command returns JSON structured like this:

```json
{
      "type": "sample",
      "id": "sample-na-2017-02-28T07:15:30Z",
      "attributes": {
        "URL": "URL of Sample Matches",
        "createdAt": "2017-02-28T07:15:30Z",
        "shardId": "na",
        "t0": "2017-02-28T07:15:30Z",
        "t1": "2017-02-28T08:15:30Z",
        "titleId": "semc-vainglory"
      },
      "relationships": {
        "assets": {
          "data": []
        }
      }
    }
```
{% endmethod %}

### HTTP Request

`GET https://api.dc01.gamelockerapp.com/shards/na/samples`

### Query Parameters

Parameter | Default | Description |
--------- | ------- | -----------   
page[offset] | 0 | Allows paging over results
page[limit] | 50 | The default (and current maximum) is 50.  Values less than 50 and great than 2 are supported.
sort | createdAt | By default, samples are sorted by creation time ascending.
filter[createdAt-Start] | none | Must occur before time. Format is iso8601 Usage: filter[createdAt-end]=2017-01-01T08:25:30Z
filter[createdAt-End] | none | Must occur after time. Format is iso8601 Usage: filter[createdAt-end]=2017-01-01T13:25:30Z
