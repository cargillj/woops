# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	plugins:
		tags:
			extension: '.html'
			injectDocumentHelper: (doc) ->
        		doc.setMeta {layout: 'tag'}

	collections:
		pages: ->
			@getCollection("html").findAllLive({isPage:true}, [{order:1}]).on "add", (model) ->
				model.setMetaDefaults({layout: "default"})

		posts: ->
			@getCollection("html").findAll({layout: 'post'}, [{date:1}])
		
		tags: ->
			@getFilesAtPath('tags/')

	templateData:
		site:
			title: "woops"

		getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
}

# Export the DocPad Configuration
module.exports = docpadConfig