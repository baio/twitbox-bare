define ["Ural/Modules/DataProvider", "Modules/twitterDataProvider"], (dataProvider, twitterDataProvider) ->

  #set defult data provider
  dataProvider.add "twi", twitterDataProvider.twitterDataProvider
  dataProvider.set "twi"