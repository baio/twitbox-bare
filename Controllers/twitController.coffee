define ["ural/Controllers/controllerBase"], (controllerBase) ->

  class TwitController extends controllerBase.ControllerBase

    ###
    item : (id, onDone) ->
      if @viewModel
        #in the case we are here from index (this case all necessary data already loaded)
        @viewModel = @viewModel.active()
        @view @defaultItemBody, @defaultItemLayout
      else
        #but we culd come here by a link
        super id, onDone
    ###

    getId : (item) ->
      #beacuse js is wrong when work with big ints
      #https://dev.twitter.com/docs/platform-objects/tweets (id)
      "#{item.id_str}"

  TwitController : TwitController