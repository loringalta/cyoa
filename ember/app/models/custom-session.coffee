`import Session from "simple-auth/session"`

CustomSession = Session.extend
  user: (->
    console.log this
    userId = @get("account")
    @container.lookup("store:main").find("account", userId) unless Ember.isEmpty(userId)
  ).property("id")

`export default CustomSession`
