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

## Contents

[TOC]

## What is a REST API?

A REST API is an application programming interface that conforms to specific architectural constraints, like stateless communication and cacheable data. It is not a protocol or standard. While REST APIs can be accessed through a number of communication protocols, most commonly, they are called over HTTPS, so the guidelines below apply to REST API endpoints that will be called over the internet.

Note: For REST APIs called over the internet, you’ll like want to follow the [best practices for REST API authentication](https://stackoverflow.blog/2021/10/06/best-practices-for-authentication-and-authorization-for-rest-apis/).

### Accept and Respond with JSON

REST APIs should accept JSON for request payload and also send responses to JSON. JSON is the standard for transferring data. Almost every networked technology can use it: JavaScript has built-in methods to encode and decode JSON either through the Fetch API or another HTTP client. Server-side technologies have libraries that can decode JSON without doing much work.  

There are other ways to transfer data. XML isn’t widely supported by frameworks without transforming the data ourselves to something that can be used, and that’s usually JSON. We can’t manipulate this data as easily on the client-side, especially in browsers. It ends up being a lot of extra work just to do normal data transfer.  

Form data is good for sending data, especially if we want to send files. But for text and numbers, we don’t need form data to transfer those since—with most frameworks—we can transfer JSON by just getting the data from it directly on the client side. It’s by far the most straightforward to do so.  

To make sure that when our REST API app responds with JSON that clients interpret it as such, we should set `Content-Type` in the response header to `application/json` after the request is made. Many server-side app frameworks set the response header automatically. Some HTTP clients look at the `Content-Type` response header and parse the data according to that format.  

The only exception is if we’re trying to send and receive files between client and server. Then we need to handle file responses and send form data from client to server. But that is a topic for another time.   

We should also make sure that our endpoints return JSON as a response. Many server-side frameworks have this as a built-in feature.  

Let’s take a look at an example API that accepts JSON payloads. This example will use the [Express](https://expressjs.com/) back end framework for Node.js. We can use the [`body-parser` middleware](https://www.npmjs.com/package/body-parser) to parse the JSON request body, and then we can call the `res.json` method with the object that we want to return as the JSON response as follows:  

```javascript
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.json());

app.post('/', (req, res) => {
  res.json(req.body);
});

app.listen(3000, () => console.log('server started'));
```

`bodyParser.json()` parses the JSON request body string into a JavaScript object and then assigns it to the `req.body` object.  

Set the `Content-Type` header in the response to `application/json; charset=utf-8` without any changes. The method above applies to most other back end frameworks.



***

Backlinks:
-	