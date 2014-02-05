require "spec_helper"

describe 'authentication routes' do
  it { expect(get: 'login').to route_to(controller: 'opinionated/sessions', action: 'new') }
end