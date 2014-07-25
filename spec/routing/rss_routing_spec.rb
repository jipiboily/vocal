require 'spec_helper'

describe 'RSS feed routing', :type => :routing do
  it { expect(get: '/feed').to route_to(controller: 'vocal/feeds', action: 'index') }
end
