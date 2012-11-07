module Refinery
  module Calendar
    class Event < Refinery::Core::BaseModel

      translates :title, :excerpt, :description, :slug

      extend FriendlyId
      friendly_id :title, :use => [:slugged, :globalize]

      belongs_to :venue

      validates :title, :presence => true, :uniqueness => true

      attr_accessible :title, :from, :to, :registration_link,
                      :venue_id, :excerpt, :description,
                      :featured, :position

      attr_accessor :locale

      alias_attribute :from, :starts_at
      alias_attribute :to, :ends_at

      delegate :name, :address,
                :to => :venue,
                :prefix => true,
                :allow_nil => true

      scope :on_day, lambda {|day| where('(refinery_calendar_events.starts_at = ?) OR (refinery_calendar_events.ends_at = ?) OR (refinery_calendar_events.starts_at < ? AND (refinery_calendar_events.ends_at > ?))', day, day, day, day) }

      class Translation
        attr_accessible :locale
      end

      class << self
        def upcoming
          where('refinery_calendar_events.starts_at >= ?', Time.now).with_globalize
        end

        def featured
          where(:featured => true).with_globalize
        end

        def archive
          where('refinery_calendar_events.starts_at < ?', Time.now).with_globalize
        end

        # Wrap up the logic of finding the events based on the translations table.
        def with_globalize(conditions = {})
          conditions = {:locale => ::Globalize.locale}.merge(conditions)
          globalized_conditions = {}
          conditions.keys.each do |key|
            if (translated_attribute_names.map(&:to_s) | %w(locale)).include?(key.to_s)
              globalized_conditions["#{self.translation_class.table_name}.#{key}"] = conditions.delete(key)
            end
          end
          # A join implies readonly which we don't really want.
          joins(:translations).where(globalized_conditions).where(conditions).readonly(false)
        end

      end
    end
  end
end
