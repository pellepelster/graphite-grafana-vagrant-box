require_relative 'spec_helper'

describe port(80) do
  it { should be_listening }
end

describe service('grafana-server') do
  it { should be_enabled }
  it { should be_running }
end

describe server(:graphite_grafana) do
  describe http('http://localhost:1080') do
    it "responds content including 'Graphite'" do
      expect(response.body).to include('Graphite')
    end
  end
  describe http('http://localhost:1080/grafana') do
    it "responds content including 'Grafana'" do
      expect(response.body).to include('Grafana')
    end
  end
end
