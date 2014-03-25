class Product < ActiveRecord::Base
  belongs_to :category

  def update_with_conflict_validation(*args)
    update(*args)
  rescue ActiveRecord::StaleObjectError
    self.lock_version = lock_version_was
    errors.add :base, 'This record changed'
    changes.except('updated_at').each do |name, values|
      errors.add name, "was #{values.first}"
    end
    false
  end
end

# validate :handle_conflit, only: :update

# def original_updated_at
#   @original_updated_at || updated_at.to_f
# end
# attr_writer :original_updated_at

# def handle_conflict
#   if @conflict || updated_at.to_f > original_updated_at.to_f
#     @conflict = true
#     @original_updated_at = nil
#     errors.add :base, 'This record changed while you were editing.'
#     changes.each do |attr, val|
#       errors.add attr, "was #{val.first}"
#     end
#   end
# end
