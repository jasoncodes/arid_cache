module AridCache
  class CacheProxy
    module Utilities
      extend self

      # Generate an ORDER BY clause that preserves the ordering of the ids in *ids*.
      #
      # The method we use depends on the database adapter because only MySQL
      # supports the ORDER BY FIELD() function.  For other databases we use
      # a CASE statement.
      def order_by(ids, klass=nil)
        column = namespaced_column(:id, klass)
        if ids.empty?
          nil
        elsif ::ActiveRecord::Base.is_mysql_adapter?
          "FIELD(#{column},#{ids.join(',')})"
        else
          order = ''
          ids.each_index { |i| order << "WHEN #{column}=#{ids[i]} THEN #{i+1} " }
          "CASE " + order + " END"
        end
      end

      # Return the column name quoted and namespaced by the table name, if the klass
      # responds to +table_name+.  Otherwise just return the column unchanged.
      def namespaced_column(column, klass=nil)
        if klass.respond_to?(:table_name)
          ::ActiveRecord::Base.connection.quote_table_name(klass.table_name) + '.' + column.to_s
        else
          column.to_s
        end
      end

      # Return the object's class or the object if it is a class.
      def object_class(object)
        object.is_a?(Class) ? object : object.class
      end

      # Find and return records of the given +klass+ which have id in +ids+.
      # +find_opts+ is a hash of options which are passed to find.
      # If no order option is given, the ordering of the ids is preserved.
      def find_all_by_id(klass, ids, find_opts={})
        find_opts = Options.new(find_opts.merge(:result_klass => klass)).opts_for_find(ids)
        if AridCache.framework.active_record?(3)
          option_map = {
            :conditions => :where,
            :include => :includes
          }
          query = find_opts.inject(klass.scoped) do |scope, pair|
            key, value = pair
            key = option_map[key] || key
            scope.send(key, pair[1])
          end
          query = query.scoped.where(Utilities.namespaced_column(:id, klass) + ' in (?)', ids)
          # Fix http://breakthebit.org/post/3487560245/rails-3-arel-count-size-length-weirdness
          query.class_eval do
            alias_method :size, :length
            alias_method :count, :length
          end
          query
        else
          klass.find_all_by_id(ids, find_opts)
        end
      end
    end
  end
end
