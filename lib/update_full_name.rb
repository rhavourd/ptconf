#
# Simple module to provide method for generating the full_name field
#
# Got an out-of-date table that needs full_name populated?  Try something like this:
#     Student.all.map {|s| s.send(:update_full_name); s.save!}
#

module UpdateFullName
  extend ActiveSupport::Concern

  included do
    before_save :update_full_name
  end

  module ClassMethods
    # ...
  end

  module InstanceMethods
    def name
      full_name
    end

    private

    # Probably a better way to write this
    def update_full_name
      self.full_name = (last_name ? last_name + ", " : "") + (first_name ? first_name : "")
    end
  end

end
