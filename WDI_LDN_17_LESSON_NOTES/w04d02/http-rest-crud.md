WDI
======
## Intro to REST

###Learning Objectives:

- Explain the concept of HTTP in more detail
- Explain the concept of a resource
- Explain the concept of REST
- Look at HTTP requests in action

<br>
---

| **Section**      | **Timing** | **Summary** |
|------------------|------------|-------------|
| **Opening**: HTTP & REST | 10 mins | Introduce the terms HTTP and REST             
| **I Do**: What is REST? | 10 mins | Explanation of what REST stands for
| **I Do**: Representing a Resource with REST | 10 mins | What a is a resource?
| **I Do**: More about HTTP | 10 mins | An explanation of HTTP
| **We do**: HTTP at Work | 10 mins | Looking at an HTTP request in Chrome console
| **I Do**: RESTful actions | 10 mins | What are restful actions                 
| **I Do**: REST vs CRUD | 10 mins | Brief explanation of REST vs CRUD
| **Closure**          | 10 mins    | Summary of the lesson. Give out error codes markdown                                             
| **Questions**        | 10 mins    | Any questions?

<br>
---

###Connection to a long term learning goal 

- REST is a core concept of web development
- WDI Students should be able to apply their knowledge of REST and HTTP to any language.

<br>
---

###Before Class (Student Pre-work)

[Please list any readings, practice problems, videos that would be helpful to complete before this lesson, prior knowledge to link]

<br>
---

###Related Homework	

- Read the list of error codes.
- The [OSI Model](https://www.youtube.com/watch?v=HEEnLZV2wGI).

<br>
---

Intro to REST
=====

## Opening: HTTP & REST

#### What is HTTP?

HTTP stands for:

##### Q. Ask the class:

- **H**yper**T**ext
- **T**ransfer
- **P**rotocol

> HTTP is the protocol that allows for sending documents back and forth on the web.

#### OSI Model

HTTP is an application layer on the OSI model. But what is the OSI model?

1. Application layer (The user interacts with this, i.e. Chrome)
2. Presentation layer (Operating system)
3. Session layer (Session between two computers)
4. Transport layer (How much information should be sent back and forth)
5. Network layer (Routers, IP addresses)
6. Data link layer (Switches, all computers are physically plugged into)
7. Physical layer (Patch panels, wires)

The [OSI Model](https://www.youtube.com/watch?v=HEEnLZV2wGI).

HTTP is the life of the web. It's used every time you transfer a document, or make an `AJAX` request. But HTTP is surprisingly a relative unknown among some web developers. 

#### What is a protocol?

A protocol is a set of rules that determines which messages can be exchanged, and which messages are appropriate replies to others. 

#### Obey the rules

With HTTP, you have to obey the rules. It's not optional.

#### Other protocols?

Another common protocol is POP3, which you might use to fetch email on your hard disk.

This introduction will demonstrate how the set of design principles, known as **REST**, underpin HTTP, and allow you to embrace its fullest power by building interfaces, which can be used from nearly any device or operating system.

<br> 

## I Do: What is REST?

REST stands for 

- **R**epresentional 
- **S**tate 
- **T**ransfer

> REST is a simple way to organize interactions between independent systems.

#### Suggested! But not...

**REST is a design pattern**, a suggested way of organising the design of your application. It is not a rule like HTTP protocol. 

The use of the REST design pattern has been growing in popularity since 2005, and has inspired the design of great services, such as the Twitter API. This is due to the fact that because REST is a convention, it allows different systems and devices to interact together in a common way. 

In theory, REST is not tied to the web, but it's almost always implemented as such, and was inspired by HTTP. As a result, REST can be used wherever HTTP can.

#### What is the alternative?

The alternative is building relatively complex conventions on top of HTTP. Often, this takes the shape of entire new XML-based languages. The most illustrious example is [SOAP](http://en.wikipedia.org/wiki/SOAP). Everyone who wants to use a service that implements this design pattern has to learn a completely new set of conventions. Essentially, it's slow and annoying...

Now that the wheel has been invented, why try to change it?

<br>

## I Do: Representing a Resource with REST

We talk about representing a resource. A resource is a way of modelling Objects. Examples of resources might be:

- Friends on a social network
- Articles on Wikipedia
- Videos on Youtube
- Purchases on an Amazon account

<br>

## I Do: More about HTTP

Let's look at the building blocks of HTTP:

#### Draw on board

- URLs
- HTTP verbs
- Response codes. 

We going to look at how to use these building blocks in a RESTful way. 

### Saving & Retrieving information using HTTP

Just think of a web application as a piece of software built to help people store and access information about resources.

#### HTTP requests help you request this information

Whenever your web browser or application fetches a file (a page, a picture, etc) from a web server, it does so using HTTP.  

HTTP is a **request/response** protocol, which means your computer sends a request for some file (e.g. "Get me the file 'home.html'") and the web server sends back a response (e.g. "Here's the file", followed by the file itself).

In HTTP, there are two different roles: 

- Client
- Server 

In general, the client always initiates the conversation; the server replies. HTTP is text based; that is, messages are essentially bits of text, although the message body can also contain other media. Text usage makes it easy to monitor an HTTP exchange.

HTTP messages are made of: 

- A header and a body. 

The body can often remain empty; it contains data that you want to transmit over the network, in order to use it according to the instructions in the header. 

#### Metadata and HTTP methods

The header contains **metadata**, such as encoding information; but, in the case of a request, it also contains the important **HTTP methods**. 

In the REST style, you will find that header is often more significant than the body.

<br>

## We do: HTTP at Work

1. Open the Chrome Developer Tools ```cmd+alt+j```
2. Open the tab called ```Network```
3. Navigate to [Youtube Videos](https://www.youtube.com/videos)
4. Have a look at the full HTTP conversation between Youtube's server and the client (your machine)

Notice that there is a table of HTTP requests:

| **Section**      | **Example** | 
|------------------|-------------|
| Path     | videos
| Method   | GET
| Status   | 302 (Found)
| Type     | text/html
| Intiator | Other
| Size (Content) | 647B
| Latency (Time) | 53ms

If you click on ```videos``` a panel will open up that will show you:

- Headers
- Preview
- Response
- Cookies
- Timing

Here we can get a bit more information about each HTTP Request.

<br>

##I Do: 7 Restful Routes

When requesting information about a resource from an application, RESTful design patterns dictate that you should be able to do 7 key actions.

We call these the 7 restful routes and they are created by combining:

- URL
- HTTP Verb (in the HTTP Request)
- Action (in the application)

#### An example:

Consider the 7 RESTFUL routes for requesting a resource of **photos**.

Send accross: [gist](https://gist.github.com/alexpchin/09939db6f81d654af06b)

| **URL** | **HTTP Verb** |  **Action**|
|------------|-------------|------------|
| /photos/         | GET       | index  
| /photos/new         | GET    | new   
| /photos          | POST      | create   
| /photos/:id      | GET       | show       
| /photos/:id/edit | GET       | edit       
| /photos/:id      | PATCH/PUT | update    
| /photos/:id      | DELETE    | destroy  

  
#### Limiting actions

Applications might limit the permissions of specific users' actions using authentication especially for actions that involve ***deleting***, ***updating*** and ***editing*** but usually the ones that don't change anything are accessible to the user. *(Or else they wouldn't be able to get any information from the web app!)*

We can group these RESTful actions into 3 main categories:

* **Posting** data (e.g. create and/or update)
* **Reading** data (e.g. make queries)
* **Deleting** data (e.g. remove something) 

Although there are other actions, these actions can mainly be grouped by these 3 categories - for example, looking at a list of all the posts on a blog is an example of **Reading** & looking at just one blog post is also an example of **Reading**.

<br>

## I Do: REST vs CRUD
Another way of understanding the concept is that REST uses HTTP to allow users to  do all the four main CRUD operations.

* **C**reate
* **R**ead
* **U**pdate
* **D**elete

CRUD is defined on Wikipedia as:

> In computer programming, create, read, update and delete (CRUD) (Sometimes called SCRUD with an "S" for Search) are the four basic functions of persistent storage.

<br>

##REST is super cool!

The REST service is:

* **Platform-independent** (you don't care if the server is Unix, the client is a Mac, or anything else),
* **Language-independent** (C# can talk to Java, etc.),
* **Standards-based** (runs on top of HTTP).

<br>

##Closure

Send out the list of error codes.

<br>

###Questions

Any questions?

<br>