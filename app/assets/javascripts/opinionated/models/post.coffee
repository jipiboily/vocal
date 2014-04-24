attr = DS.attr

Opinionated.Post = DS.Model.extend
  title: attr('string')
  markdown: attr('string')
  html: attr('string')
  published_at: attr('string')
  published: attr('boolean')
  url: attr('string')