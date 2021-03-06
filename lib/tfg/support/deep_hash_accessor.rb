module TFG
  module Support
    class DeepHashAccessor
      def initialize(hash)
        self.hash = hash
      end

      def [](*keys)
        head, *tail = keys

        if tail.empty?
          hash[head]
        else
          hash[head].deep[*tail] if hash[head]
        end
      end

      def []=(*keys, value)
        head, *tail = keys

        if tail.empty?
          hash[head] = value
        else
          hash[head] ||= Hash.new
          hash[head].deep[*tail] = value
        end
      end

      private

      attr_accessor :hash
    end
  end
end