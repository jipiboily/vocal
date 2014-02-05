require "spec_helper"

describe 'admin routes' do
  it { expect(get: 'admin/').to route_to(controller: 'opinionated/admin/app', action: 'app') }
end