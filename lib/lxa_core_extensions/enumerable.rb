module Enumerable

  # shorthand for the common idiom of using inject to populate a hash
  # from an Enumerable
  #
  #   [[1,2],[3,4],[5,6]].build_hash        #=> {1=>2, 3=>4, 5=>6}
  #   [[1,2],[3,4],[5,6]].build_hash(:last) #=> {2=>[1,2], 4=>[...],...}
  #
  #   [1,2,3].build_hash { |h,k| h[k] = k } #=> {1=>1, 2=>2, 3=>3}
  #
  # # the last example is identical to:
  #
  #   [1,2,3].inject({}) { |h,k| h[k] = k; h }
  #
  def build_hash(hsh_or_action = {})
    if block_given?
      raise ArgumentError if hsh_or_action.is_a?(Symbol)

      inject(hsh_or_action) do |h,*args|
        yield h, *args
        h
      end
    else
      hsh, action = *if hsh_or_action.is_a?(Symbol)
                       [{}, hsh_or_action]
                     else
                       [hsh_or_action, nil]
                     end

      if action
        build_hash(hsh) { |h,v| k = v.send(action); h[k] = v }
      else
        build_hash(hsh) { |h,(k,v)| h[k] = v }
      end
    end
  end

  def tally
    group_by { |x| x }.map { |k,v| [v.length, k] }
  end
end
