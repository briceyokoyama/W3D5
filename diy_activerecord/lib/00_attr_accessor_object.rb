class AttrAccessorObject
  def self.my_attr_accessor(*names)

    names.each do |name|
      # heredoc = <<-CODE

      #   def #{name}
      #     @#{name}
      #   end

      #   def #{name}=(val)
      #     @#{name} = val
      #   end

      # CODE

      # self.class_eval(heredoc)

      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |val|
        instance_variable_set("@#{name}", val)
      end

    end
  end
end
