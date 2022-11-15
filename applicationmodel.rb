class ApplicationModel
  def self.has_many(*args)
      define_method args[0].to_sym do
      klass=args[0][0,4]
      klass=Object.const_get(klass.capitalize)
      ObjectSpace.each_object(klass).to_a.reverse.select {|i|i.order_id == self.id }
    end
  end
end