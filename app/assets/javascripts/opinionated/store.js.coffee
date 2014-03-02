# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

DS.RESTAdapter.reopen
  namespace: 'api/v1'

Opinionated.Store = DS.Store.extend({

})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
# TODO: change Ember-data to 1.0.0 beta version to use the following...
# Opinionated.ApplicationAdapter = DS.ActiveModelAdapter.extend({
#
# })
