App.CustomSession = SimpleAuth.Session.extend({
        account: function() {
          var accountId = this.get('secure.account_id');
          if (!Ember.isEmpty(accountId)) {
            return DS.PromiseObject.create({
              promise: this.container.lookup('store:main').find('account', accountId)
            });
          }
        }.property('secure.account_id')
      });