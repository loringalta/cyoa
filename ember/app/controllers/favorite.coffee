`import Ember from "ember"`

FavoriteController = Ember.ObjectController.extend({
  ownedBy: (->
    @model.get('userId') == @get('session').get('id')
    ).property('model', 'session.id')
})

`export default FavoriteController`
