require 'ostruct'

class Hash

  #   { 4=>35, 9=>nil, 10=>false }.compact            #=> {4=>35, 10=>false}
  #   { 4=>35, 9=>nil, 10=>false }.compact(&:blank?)  #=> {4=>35}
  #
  def compact
    reject { |k,v| block_given? ? yield(v) : v.nil? }
  end

  # make a new hash with the existing values as the new keys
  # - like #rassoc for each existing key
  # - like invert but with *all* keys as array
  #
  #   {1=>2, 3=>4, 5=>6, 6=>2, 7=>4}.flip #=> {2=>[1, 6], 4=>[3, 7], 6=>[5]}
  #
  def flip
    build_hash { |h,(k,v)| h[v] ||= []; h[v] << k }
  end


  # change all the keys of the has by yielding it to the supplied block, recursively
  #
  #   {1=>2, 3=>4, 5=>{6=>7, 8=>9}}.rekey(&:to_s) #=> {"1"=>2,"3"=>4, "5"=>{"6"=>7, "8"=>9}}
  #
  def rekey(&block)
    build_hash do |h,(k,v)|
      new_key = yield(k)
      new_val = v.is_a?(Hash) ? v.rekey(&block) : v

      h[new_key] = new_val
    end
  end

  # return all the keys of all the sub hashes
  #
  def nested_keys(&block)
    Enumerator.new do |y|
      to_a.each do |k,v|
        y.yield k
        v.nested_keys { |nk| y.yield(nk) } if v.is_a?(Hash)
      end
    end.each(&block)
  end


  def to_ostruct
    OpenStruct.new(self)
  end
end

