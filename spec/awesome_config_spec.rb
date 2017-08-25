require 'spec_helper'

describe ConfigStore do
  describe "#[]" do
    context "missing top level key" do
      it "returns an empty hash" do
        expect(ConfigStore["this will be empty"]).to eq({})
      end
    end

    context "missing top level and child key" do
      it "returns nil" do
        expect(ConfigStore["this will be"]["nil"]).to eq(nil)          
      end
    end

    context "indifferent access" do
      it "works" do
        ConfigStore.load({"key" => "value"})

        expect(ConfigStore["key"]).to eq("value")
        expect(ConfigStore[:key]).to eq("value")          
      end
    end
  end
end

# "live tests", just to make sure it works...
describe AWSSSMParameterStore do
  describe "loading the config" do
    it "loads the config" do
      # this isn't stubbed...
      # if your keys aren't setup, it'll return {}
      expect(AWSSSMParameterStore.new(keys: ['test']).get).to eq({})
    end
  end
end