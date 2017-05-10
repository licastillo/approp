MoneyRails.configure do |config|

  config.default_currency = :clp

  config.register_currency = {
      :priority            => 1,
      :iso_code            => "UF",
      :name                => "Unidad de fomento",
      :symbol              => "UF",
      :symbol_first        => true,
      :subunit             => "Subcent",
      :subunit_to_unit     => 1,
      :thousands_separator => ".",
      :decimal_mark        => ","
    }

  config.add_rate "CLP", "UF", 0.00003760388
  config.add_rate "UF", "CLP", 26593

end
