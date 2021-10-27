- **URL:** https://medium.com/p/e57a25ab2f0a
- **Author:** Abracadabra
- **Tags:** #Type/Source/Article
- **Date:** [2021-05-28](../_daily/2021-05-28.md)
---

The solution is a lease. The first cache miss will grant the app server a lease token. Only the app server having the token for a key can query DB and fill the cache. After a token is issued, all subsequent requests to the cache will be asked to retry after a period. The lease expires after a while to avoid deadlock %% highlight_id: 184655479 %%

