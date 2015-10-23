require_relative 'spec_helper'

services = %w{
        uwsgi
        carbon-cache
}

services.each do |p|
  describe service(p) do
    it { should be_running }
    it { should be_enabled }
  end
end

describe port(2003) do
  it { should be_listening }
end
