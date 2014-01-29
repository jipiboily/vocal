require "spec_helper"

describe do
  routes { Opinionated::Engine.routes }

  it { expect(get: 'admin').to route_to(controller: 'opinionated/admin', action: 'app') }
end