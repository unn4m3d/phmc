abstract class BaseSerializer < Lucky::Serializer
  def self.for_collection(collection : Enumerable, *args, **named_args)
    {

      self.collection_key => collection.map do |object|
        new(object, *args, **named_args)
      end
    }
  end
end
