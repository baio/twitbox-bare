define ->

  class TwitterDataProvider

    load: (srcName, filter, callback) ->
      switch srcName
        when "Twit"
          if filter.$expand == "$index"
            $.getJSON "https://api.twitter.com/1/statuses/user_timeline.json?screen_name=baio1980&count=#{filter.$itemsPerPage}&include_rts=1&page=#{filter.$page}&trim_user=1&callback=?", (data) ->
              callback (if !data then "error" else null), data
          else
            $.getJSON "https://api.twitter.com/1/statuses/show.json?id=#{filter.$filter.id.$eq}&include_entities=true&callback=?", (data) ->
              callback (if !data then "error" else null), [data]
        else
          callback(null, [])

    save: (srcName, item, callback) ->
      callback()

  twitterDataProvider : new TwitterDataProvider()