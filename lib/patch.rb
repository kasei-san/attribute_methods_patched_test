module ActiveRecord
  module AttributeMethodsWithPatch
    # enumの値を文字列で指定して、new した場合、#{key}_before_type_cast も、文字列のままなので注意
    #
    # 例
    # t = Test.new(status: active)
    # t[:active] # => "active"
    #
    # t = Test.create(status: active)
    # t[:active] # => 1
    #
    def [](key)
      if @attributes[key.to_s].type.class == ActiveRecord::Enum::EnumType
        self.send("#{key}_before_type_cast")
      else
        super(key)
      end
    end
  end

  module AttributeMethods
    prepend AttributeMethodsWithPatch
  end
end
