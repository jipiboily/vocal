require "spec_helper"

describe 'authentication routes' do
  it { expect(get: 'login').to route_to(controller: 'opinionated/sessions', action: 'new') }
  it { expect(post: 'login').to route_to(controller: 'opinionated/sessions', action: 'create') }

  it { expect(get: 'logout').to route_to(controller: 'opinionated/sessions', action: 'destroy') }

  it { expect(get: 'signup').to route_to(controller: 'opinionated/users', action: 'new') }
  it { expect(post: 'signup').to route_to(controller: 'opinionated/users', action: 'create') }
end