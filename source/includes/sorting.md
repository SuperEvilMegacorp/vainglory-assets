### Sorting

All resource collections have a default sort order.  In addition, some resources
provide the ability to sort according to one or more criteria ("sort fields").

```shell
curl "https://api.dc01.gamelockerapp.com/matches?sort=createdAt" \
  -H "Authorization: Bearer aaa.bbb.ccc" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

The above example should return the oldest articles first, meaning that
the default sort order is always ascending. Ascending corresponds to the
standard order of numbers and letters, i.e. A to Z, 0 to 9).  For dates and times,
ascending means that earlier values precede later ones e.g. 1/1/2000 will sort
ahead of 1/1/2001.

If sort fields are is prefixed with a minus, the order will be changed to descending.

```shell
curl "https://api.dc01.gamelockerapp.com/matches?sort=-createdAt" \
  -H "Authorization: Bearer aaa.bbb.ccc" \
  -H "X-TITLE-ID: semc-vainglory" \
  -H "Accept: application/vnd.api+json"
```

The above example should return the newest articles first.
