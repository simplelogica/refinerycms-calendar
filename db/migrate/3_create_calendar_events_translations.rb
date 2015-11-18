class CreateCalendarEventsTranslations < ActiveRecord::Migration
  def change
    translation_table = if defined? Refinery::Calendar::Event::Translation
      Refinery::Calendar::Event::Translation.table_name
    else
      "refinery_calendar_event_translations"
    end

    create_table translation_table do |t|
      t.belongs_to Refinery::Calendar::Event.table_name.singularize
      t.string :locale
      t.string :title
      t.string :excerpt
      t.string :description
      t.string :slug
      t.timestamps
    end

    add_index translation_table, :locale
  end
end
