module YamlBuddy
  def take_yaml(yml)
    @data = YAML::load(yml)
  end

  def to_yaml
    @data.to_yaml
  end
end
