require 'spec_helper'

describe 'posts routing' do
  it { expect(get: '/').to route_to(controller: 'opinionated/posts', action: 'index') }
end