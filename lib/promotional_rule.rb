class PromotionalRule
  def multibuy_promotion
    YAML.load_file './lib/promotional_rules.yaml'
  end
end