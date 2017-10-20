![ga_cog_large_red_rgb](https://cloud.githubusercontent.com/assets/40461/8183776/469f976e-1432-11e5-8199-6ac91363302b.png)

WDI
======
## Soundmanager Library
[i]: Soundmanager V2.97a.20131201

### Core Competencies:

- Core Competency #1
- Core Competency #2

<br>
---

### Learning Objectives: 

- Explain how to use JavaScript to make browsers do cool things.
- Explain how to use the SoundManager2 library
- Use Object Orientated Javascript

<br>
---

### Timings:
| **Section** | **Timing** | **Summary** |
|-------------|------------|-------------|
| **Opening** | 10 mins | Introduction to using the Soundmanager library          
| **We Do**: Look at the starter code | 10 mins | Let's look at the starter code
| **We Do**: SoundManager documentation | 10 mins | Setup the browser to play a sound 
| **We Do**: Create a click handler | 15 mins | Click link and play a sound
| **We Do**: Playing multiple sounds | 10 mins | We want to change the app so that it can play multiple sounds
| **We Do**: Create a pause button | 10 mins | Create a pause function
| **We Do**: Managing state with data attributes | 10 mins | Intro in to data attributes, add state to the app for play/pause
| **Closure** | 10 mins | Summary of the lesson and further problems                                       
| **Questions** | 10 mins | Any questions?

<br>
---

###Connection to a long term learning goal 

WDI Students should be confident using unfamiliary libraries.

<br>
---

###Before Class (Student Pre-work)

Bring in headphones!

<br>
---

###Related Homework	

Soundmanager DaftPunk.

<br>
---

Soundmanager Library
=====

## Opening

We've had a look at creating objects in Javascript. Let's play with creating some modular javascript that uses an object with methods and properties!

#### What is Soundmanager?

Soundmanager is just a library and we're going to have a play with it. It allows us to play music files in the app.

Soundmanager runs locally, so we don't have to worry about bandwidth or maximum requests being exceeded for an API.

#### Soundmanager vs HTML5

We can play music in the browser with native HTML5 however:

- SoundManager is more powerful
- SoundManager will automatically (and transparently!) use Flash as a fallback if HTML5 is not available.

Let's demo this by building a basic MP3 player.

<br>

## We Do: Look at the starter code

Take a look at the starting point code and open it with `subl`:

#### Tour of the starting point code

```
.
├── css
│   └── music.css
├── index.html
├── js
│   ├── music.js
│   └── soundmanager2.js
├── soundmanager
├── sounds
│   └── drumloop.mp3
└── swf
```

- We have an `index.html` file that loads `music.js` and `soundmanager2.js`
- We have some basic CSS, `music.css`
- We also have a sounds directory with one sound `drumploop.mp3`
- We have included the soundmanager library files


#### Run the app

We're going to serve this site using python, to simulate running the app on a live server with:

```
python -m SimpleHTTPServer
```

And open `http://localhost:8000`

<br>

## We Do: SoundManager documentation

When starting to work with a new framework, the first thing you need to do is to read the documentation. The Soundmanager documentation can be found here:

- [Homepage](http://www.schillmania.com/projects/soundmanager2/). 
- [Getting started section](http://www.schillmania.com/projects/soundmanager2/doc/getstarted/)

#### Setup instructions

On the getting started section, there are some basic setup instructions:

In **music.js**:

```
soundManager.setup({
  url: '/swf/',
  preferFlash: true,
  onready: function() {
    var mySound = soundManager.createSound({
      id: 'aSound', // Could be anything!
      url: '/sounds/drumloop.mp3'
    });
    mySound.play();
  }
});
```

#### What is happening here?

- We've told SoundManager where to find its flash files with the URL parameter.
- We've told it to prefer flash because it sometimes gets a bit janky with MP3 playback if we don't.
- We've given it a callback function thats created a sound, with an id 
- Then then told it to play that sound.

#### Listen?

We've got our browser to make sound! 

That's our sanity check. Now, comment it out for future reference, and let's make our play button work.

<br>

## We Do: Create a click handler

If you take a look at `index.html` you can see that we have a link.

Let's create some 'standard' JS boilerplate code with:

- App module
- Setup method
- Click handlers

```
var myPlayer = myPlayer || {};
 
myPlayer.setup = function() {
  this._playButton = document.getElementById('playbutton');
  this._playButton.addEventListener("click",  function(ev){
    myPlayer.play()
  });
};
  
myPlayer.play = function() { console.log("Not implemented yet."); };

// soundManager is already instantiated by requiring soundManager
soundManager.setup({
  url: '/swf/',
  preferFlash: true,
  onready: myPlayer.setup.bind(myPlayer)
});
```

The Soundmanager documentation says that the 'onready' callback will fire after the DOM is loaded.

So we don't need to put this inside a `DOMContentLoaded` eventListener though we could if we wanted.

- Our soundManager.setup method calls our myPlayer setup...
- ...which registers a click eventListener on our link...
- ...which calls a myPlayer.play method that *we haven't written yet*.

#### Bind

We use the [`Bind()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) method primarily to call a function with the `this` value set explicitly. It other words, `bind()` allows us to easily set which specific object will be bound to this when a function or method is invoked.

If we didn't it would have been called when the `DOMContentLoaded` event was fired, making `this` the `window`.

#### Make it play!

Let's make it play. Add this to the .play method:

```
myPlayer.play = function() {
  var sound = soundManager.createSound({
    id: 'trackId',
    url: '/sounds/drumloop.mp3'
  });
  sound.play();
};
```

<br>

## We Do: Playing multiple sounds

It would be "better" if we kept the logic of *which* sound out of the play function.

```
myPlayer.play = function() {
  var sound = this.getSound();
  sound.play();
};

myPlayer.getSound = function() {
  if (!this._currentSound) {
    this._currentSound = soundManager.createSound({
      id: 'track',
      url: '/sounds/drumloop.mp3'
    });
  };
  return this._currentSound;
};

myPlayer._currentSound = null;
```

<br>

## We Do: Create a pause button

So we can play our sound but we can't pause it.

#### Pseudo-code

As with any new functionality on our site, we first need to plan what we want to happen:

- The music should pause.
- The page symbol should probably have turned into a pause button when we started playing, and turn into a play button when we pause it.
- Our click handler should make the music start again after we click the pause.

#### Managing page "state"

So now we're starting to manage our page state a little bit. There are a few things we need to know when we are managing the state of this play/pause functionality:

- We need to know whether we're currently playing any music.
- If the app is playing, our page should pause when we click.
- If the app is paused, it should resume playing on click.

This is just a simple example. We could add lots of different things, like managing the state when the track finishes playing.

<br>

## We Do: Managing state with HTML data attributes

One way we can manage page state through JS is through data attributes.

### Setup initial state

Update the setup method so it has the initial state using the Javascript method `.setAttribute`:

```
myPlayer.setup = function(){
  this._playButton = document.getElementById('playbutton');
  this._playButton.setAttribute('data-state', 'stopped');
  this._playButton.addEventListener("click",  myPlayer.playClickHandler);
}
```

Write that playClickHandler function:

```
myPlayer.playClickHandler = function(ev) {
  ev.preventDefault();

  if (this._playButton.getAttribute('data-state') == 'playing') {
    this.pause();
  } else {
    this.play();
  }
};
```

#### Problem with `this`

When we click on the play button we get the error: 

```
Cannot read property 'getAttribute' of undefined
```

**Question**: Inside the `myPlayer.playClickHandler`, what is the value of `this`? 

Let's `console.log(this);` inside `playClickHandler`:

```
myPlayer.playClickHandler = function(ev) {
  ev.preventDefault();
  console.log(this);

  if (this._playButton.getAttribute('data-state') == 'playing') {
    this.pause();
  } else {
    this.play();
  }
};
```

We can see it's the DOM element that triggered the event handler:

```
  <p id="playbutton" data-state="stopped"><a href="#">▶</a></p>
```

#### Bind

There are a few fixes for this, but we are going to do what we did before and change the playButton eventHandler 

```
this._playButton.addEventListener("click",  this.playClickHandler.bind(this));
```

### Update the play button

Update that play function to manage the state:

```
myPlayer.play = function() {
  this.getSound();
  this._playButton.innerHTML = '&#10074;&#10074;';
 
  if (this._playButton.getAttribute('data-state') == 'stopped') { 
    this._currentSound.play();
  } else if (this._playButton.getAttribute('data-state') == 'paused') {
    this._currentSound.resume();
  } else {
    console.warn("myPlayer is in an unexpected state: " + this._playButton.getAttribute('data-state'));
  }

  // Set state of button to be playing
  this._playButton.setAttribute('data-state', 'playing');
};
```

Again we have used `bind` again because the `onfinish` callback is triggered by:

```
SMSound {id: "track", sID: "track", url: "/sounds/drumloop.mp3", options: Object, instanceOptions: Object…}
``` 

But the `.play` function is triggered by `myPlayer`.

#### Create a pause button

Now all we need to do is to write a pause function.

```
myPlayer.pause = function(){
  this._currentSound.pause();
  this._playButton.innerHTML = '&#9654';
  this._playButton.setAttribute('data-state', 'paused');
};
```

##Closure

We've built a basic MP3 player from scratch.

#### Further Exercises?

- Fix up the state when the track stops playing.
- Count the number of plays/pauses/resumes/finished tracks
- Add multi-track support.
- Utilise the _currentSound a bit better
- Organise the code further

<br>

###Questions

Any questions?

<br>