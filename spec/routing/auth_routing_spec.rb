require "spec_helper"

describe 'authentication routes', :type => :routing do
  it { expect(get: 'login').to route_to(controller: 'vocal/sessions', action: 'new') }
  it { expect(post: 'login').to route_to(controller: 'vocal/sessions', action: 'create') }

  it { expect(get: 'logout').to route_to(controller: 'vocal/sessions', action: 'destroy') }

  it { expect(get: 'signup').to route_to(controller: 'vocal/users', action: 'new') }
  it { expect(post: 'signup').to route_to(controller: 'vocal/users', action: 'create') }
end