class MapPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where('permission IN ("public", "commons") OR user_id = ?', user.id)
    end
  end

  def activemaps?
    user.blank? # redirect to root url if authenticated for some reason
  end

  def featuredmaps?
    true
  end

  def mymaps?
    user.present?
  end

  def usermaps?
    true
  end

  def show?
    record.permission == 'commons' || record.permission == 'public' || record.user == user
  end

  def contains?
    show?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.permission == 'commons' || record.user == user)
    true
  end

  def screenshot?
    update?
  end

  def destroy?
    record.user == user || admin_override
  end
end
