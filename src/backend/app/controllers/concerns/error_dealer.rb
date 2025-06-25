module ErrorDealer
  def validate_arguments!(*args)
    raise ArgumentError, "必須の引数が不足しています" if args.any?(&:nil?)
  end

  def validate_variable!(variable)
    raise StandardError, "#{variable}が不正な値です" unless variable
  end
end
