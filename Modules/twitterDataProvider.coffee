define ->

  class TwitterDataProvider

    load: (srcName, filter, callback) ->
      switch srcName
        when "Twit"
          $.getJSON "https://api.twitter.com/1/statuses/user_timeline.json?screen_name=baio1980&count=100&include_rts=1&callback=?",
              (data) -> callback (if !data then "error" else null), data
        else
          callback(null, [])

    save: (srcName, item, callback) ->
      callback()

  twitterDataProvider : new TwitterDataProvider()