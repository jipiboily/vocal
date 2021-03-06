require 'spec_helper'

describe 'posts routing', :type => :routing do
  it { expect(get: '/').to route_to(controller: 'vocal/posts', action: 'index') }
  it { expect(get: '/some-post').to route_to(controller: 'vocal/posts', action: 'show', post_url: 'some-post') }
end