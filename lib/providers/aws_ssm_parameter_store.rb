class AWSSSMParameterStore
  def initialize(region: 'us-west-2', prefix: '', keys: [], remove_prefix_on_response: true)
    @region = region
    @keys = keys.map { |k| prefix + k }
    @prefix = prefix
    @remove_prefix_on_response = remove_prefix_on_response
  end

  def get
    ({}.tap do |hash|
      get_ssm_params.each do |param|
        hash[friendly_param_name(param)] = friendly_param_value(param)
      end
    end)
  end

  private

  attr_reader :region, :prefix, :keys, :remove_prefix_on_response

  def friendly_param_name(param)
    return param.name if prefix.blank?
    param.name.gsub(prefix, '')
  end

  def friendly_param_value(param)
    JSON.parse(param.value)
  rescue JSON::ParserError => e  
    param.value      
  end

  def get_ssm_params
    client = Aws::SSM::Client.new(region: region)
    response = client.get_parameters({
      names: keys,
      with_decryption: true,
    })

    response.parameters
  end
end
  