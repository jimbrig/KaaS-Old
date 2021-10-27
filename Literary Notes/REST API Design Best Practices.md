---
Date: 2021-10-27
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Alias: REST API Design Best Practices
---

Source Type: #Type/Source/Article 

# REST API Design Best Practices

*Source: [Best practices for REST API design](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/)*

REST APIs are one of the most common kinds of web services available today. They allow various clients including browser apps to communicate with a server via the REST API. Therefore, it’s very important to design REST APIs properly so that we won’t run into problems down the road. We have to take into account security, performance, and ease of use for API consumers. 

Otherwise, we create problems for clients that use our APIs, which isn’t pleasant and detracts people from using our API. If we don’t follow commonly accepted conventions, then we confuse the maintainers of the API and the clients that use them since it’s different from what everyone expects.

REST APIs should be easy to understand for anyone consuming them, future-proof, secure, and fast since they serve data to clients that may be confidential and time-sensitive.

-   [Accept and respond with JSON](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-accept-and-respond-with-json)
-   [Use nouns instead of verbs in endpoint paths](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-use-nouns-instead-of-verbs-in-endpoint-paths)
-   [Name collections with plural nouns](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-name-collections-with-plural-nouns)
-   [Nesting resources for hierarchical objects](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-nesting-resources-for-hierarchical-objects)
-   [Handle errors gracefully and return standard error codes](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-handle-errors-gracefully-and-return-standard-error-codes)
-   [Allow filtering, sorting, and pagination](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-allow-filtering-sorting-and-pagination)
-   [Maintain Good Security Practices](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-maintain-good-security-practices)
-   [Cache data to improve performance](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-cache-data-to-improve-performance)
-   [Versioning our APIs](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/#h-versioning-our-apis)


## What is a REST API?

A REST API is an application programming interface that conforms to specific architectural constraints, like stateless communication and cacheable data. It is not a protocol or standard. While REST APIs can be accessed through a number of communication protocols, most commonly, they are called over HTTPS, so the guidelines below apply to REST API endpoints that will be called over the internet.

Note: For REST APIs called over the internet, you’ll like want to follow the [best practices for REST API authentication](https://stackoverflow.blog/2021/10/06/best-practices-for-authentication-and-authorization-for-rest-apis/).

***

Backlinks:
-	