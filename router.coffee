define ["ural/routerBase"], (routerBase) ->

  class Router extends routerBase.RouterBase

    constructor: ->
      super "Controllers", "twit/index"

  Router : Router