module Mongoid
  module Relations
    module Eager

      class BelongsTo < Base

        def preload
          raise Errors::EagerLoad.new(@metadata.name) if @metadata.polymorphic?
          each_loaded_document do |doc|
            id = doc.send(key)
            set_on_parent(id, doc)
          end
        end

        def group_by_key
          @metadata.foreign_key
        end

        def key
          @metadata.primary_key
        end
      end
    end
  end
end
