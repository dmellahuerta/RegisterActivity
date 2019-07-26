# frozen_string_literal: true

path_migration = Rails.root.join('../dummy/db/migrate')
ActiveRecord::MigrationContext.new(path_migration).migrate
