`import Session from "simple-auth/session";`

CustomSession = Session.extend
  user: (->
    userId = @get("id")
    @container.lookup("store:main").find("user", userId) unless Ember.isEmpty(userId)
  ).property("id")

`export default CustomSession;`