$(document).ready(function() {

  twitter["remainingChar"];
  twitter["tweetTooBig"] = false;


  // Object constuctor to build a new tweet
  // ** thumbnail: Accept url for thumbnail
  // ** tweetContent: Takes a string representing the content of the tweet
  // ** name: takes the full name of the poster
  // ** handle: takes the twitter handle of the poster
  twitter.tweetBuilder = function(thumbnail, tweetContent, name, handle){
    this.user_thumbnail = thumbnail;
    this.created_at = moment().format("YYYY-MM-DD HH:mm:ss ZZ");
    this.text = tweetContent;
    this.name = name;
    this.screen_name = handle;
  };

  // Function that build the element that represent the tweet on the page
  // ** index: the index of the requested tweet in twitter.tweet array
  // ** preOrAppend: takas either 'prepend' or 'append', choose where to put the tweet in the feed 
  twitter.generateTweet = function(index, preOrAppend){
    var tweetInfo = twitter.tweets[index];
    var image = tweetInfo.user_thumbnail;
    var fullName = tweetInfo.name;
    var username = tweetInfo.screen_name;
    var timeAgo = moment(tweetInfo.created_at).fromNow();
    var tweetContent = tweetInfo.text;
    // this looks terrible let's all pretend it never happened
    var el = '<div class="tweet">\
                <a href="http://bit.ly/IqT6zt">\
                  <img src="'+ image + '" alt="User image goes here.">\
                </a>\
                <div class="content">\
                  <strong class="fullname">'+ fullName+ '</strong>\
                  <span>&rlm;</span>\
                  <span>@</span><b>' + username + '</b>\
                  &nbsp;&middot;&nbsp;\
                  <small class="time">\
                    '+ timeAgo + '\
                  </small>\
                  <p>'+ tweetContent + '</p>\
                </div>\
              </div>';
    if (preOrAppend === "prepend") {
      $(".stream-items").prepend(el);
    }
    else if (preOrAppend === "append") {
      $(".stream-items").append(el);
    }
    
  }


  // Loop through the array to build the full list
  twitter.buildTweetList = function(){
    $.each(twitter.tweets, function(index){
        twitter.generateTweet(index, "append");
    });
  }


  // Click event for the submit button to create a new tweet
  $("#submit").on('click', function(e){
    e.preventDefault();

    if (twitter.remainingChar < 0) {
      $(".tweet-counter").css({"color": "#8899a6", "font-style": "italic"});
      setTimeout(function() {
        $(".tweet-counter").css({"color":"tomato", "font-style": "normal"});
      }, 250);
    }

    else if ($("#new-tweet-input").val() != "") {
      var message = $("#new-tweet-input").val();
      var newTweet = new twitter.tweetBuilder("http://www.placecage.com/50/50", message, "Tim Dévé", "tim");
      $("#new-tweet-input").val("");
      twitter.tweets.unshift(newTweet);
      twitter.generateTweet(0, "prepend");
      twitter.remainingChar = 140;
      $(".tweet-counter").html(twitter.remainingChar);
    }
  });


  // key press event to update the state of the tweet
  $(document).keyup(function(){
    var messLength = $("#new-tweet-input").val().length;
    twitter.remainingChar = 140 - messLength;
    $(".tweet-counter").html(twitter.remainingChar);

    if (twitter.remainingChar < 0) {
      twitter.tweetTooBig = true;
      $(".tweet-counter").css("color","tomato");
    }
    else {
      twitter.tweetTooBig = false;
      $(".tweet-counter").css("color","#8899a6");

    }

  });

  // build the full tweet list once
  twitter.buildTweetList();
});
