#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require bootstrap-sprockets
#= require_self
#= require rubybookshelf

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create({
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
})

App.ApplicationAdapter = DS.ActiveModelAdapter

