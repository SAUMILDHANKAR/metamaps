# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :metacode }
  it { is_expected.to have_many :maps }
  it { is_expected.to have_many :mappings }
  it { is_expected.to validate_presence_of :permission }
  it { is_expected.to validate_inclusion_of(:permission).in_array Perm::ISSIONS.map(&:to_s) }
end
